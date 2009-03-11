# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit git flag-o-matic autotools

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org"
EGIT_REPO_URI="git://git.musicpd.org/master/mpd.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="aac alsa ao audiofile bzip2 cdio curl debug doc ffmpeg fifo flac gprof icecast id3 ipv6 jack lame lastfmradio libmms libsamplerate mad midi -mikmod modplug musepack ogg oss pipe pulseaudio sid +sysvipc unicode vorbis wavpack zeroconf zip"

WANT_AUTOMAKE="1.10"
RDEPEND="!sys-cluster/mpich2
	>=dev-libs/glib-2.4:2
	aac? ( >=media-libs/faad2-2.0_rc2 )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4 )
	audiofile? ( media-libs/audiofile )
	bzip2? ( app-arch/bzip2 )
	cdio? ( dev-libs/libcdio )
	curl? ( net-misc/curl )
	ffmpeg? ( media-video/ffmpeg )
	flac? ( media-libs/flac
		ogg? ( media-libs/flac[ogg] ) )
	icecast? ( lame? ( media-libs/libshout )
		vorbis? ( media-libs/libshout ) )
	id3? ( media-libs/libid3tag )
	jack? ( media-sound/jack-audio-connection-kit )
	lame? ( icecast? ( media-sound/lame ) )
	libmms? ( media-libs/libmms )
	libsamplerate? ( media-libs/libsamplerate )
	mad? ( media-libs/libmad )
	midi? ( media-libs/wildmidi )
	mikmod? ( media-libs/libmikmod )
	modplug? ( media-libs/libmodplug )
	musepack? ( media-libs/libmpcdec )
	ogg? ( media-libs/libogg )
	pulseaudio? ( media-sound/pulseaudio )
	sid? ( media-libs/libsidplay:2 )
	vorbis? ( media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )
	zeroconf? ( net-dns/avahi )
	zip? ( dev-libs/zziplib )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	doc? ( app-doc/doxygen
		app-text/xmlto )"

pkg_setup() {
	if use icecast && ! use lame && ! use vorbis; then
		ewarn "USE=icecast enabled but lame and vorbis disabled,"
		ewarn "disabling icecast"
	fi

	enewuser mpd "" "" "/var/lib/mpd" audio
}

src_prepare() {
	eautoreconf
	epatch "${FILESDIR}"/mpdconf.patch
}

src_configure() {
	local myconf=""

	if use icecast; then
		myconf+=" $(use_enable vorbis shout_ogg) $(use_enable lame shout_mp3)"
	else
		myconf+=" --disable-shout_ogg --disable-shout_mp3"
	fi

	append-lfs-flags

	econf \
		$(use_enable aac) \
		$(use_enable alsa) \
		$(use_enable ao) \
		$(use_enable audiofile) \
		$(use_enable bzip2) \
		$(use_enable curl) \
		$(use_enable cdio iso9660) \
		$(use_enable debug) \
		$(use_enable doc documentation) \
		$(use_enable fifo) \
		$(use_enable ffmpeg) \
		$(use_enable flac) \
		$(use_enable gprof) \
		$(use_enable id3) \
		$(use_enable ipv6) \
		$(use_enable jack) \
		$(use_enable modplug) \
		$(use_enable lastfmradio lastfm) \
		$(use_enable libmms mms) \
		$(use_enable libsamplerate lsr) \
		$(use_enable mad mp3) \
		$(use_enable mikmod mod) \
		$(use_enable musepack mpc) \
		$(use_enable oss) \
		$(use_enable pipe pipe-output) \
		$(use_enable pulseaudio pulse) \
		$(use_enable sid sidplay) \
		$(use_enable sysvipc un) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable wavpack) \
		$(use_enable midi wildmidi) \
		$(use_enable zip) \
		$(use_with zeroconf zeroconf avahi) \
		${myconf}
}

src_install() {
	dodir /var/run/mpd
	fowners mpd:audio /var/run/mpd
	fperms 750 /var/run/mpd
	keepdir /var/run/mpd

	emake DESTDIR="${D}" install || die "emake install failed"
	rm -rf "${D}"/usr/share/doc/mpd/

	dodoc AUTHORS NEWS README TODO UPGRADING
	dodoc doc/protocol.html

	insinto /etc
	newins doc/mpdconf.example mpd.conf

	newinitd "${FILESDIR}"/mpd.rc mpd

	if use unicode; then
		dosed 's:^#filesystem_charset.*$:filesystem_charset "UTF-8":' \
			/etc/mpd.conf || die "dosed failed"
	fi

	diropts -m0755 -o mpd -g audio
	dodir /var/lib/mpd
	keepdir /var/lib/mpd
	dodir /var/lib/mpd/music
	keepdir /var/lib/mpd/music
	dodir /var/lib/mpd/playlists
	keepdir /var/lib/mpd/playlists

	if use alsa; then
		dosed 's:need :need alsasound :' /etc/init.d/mpd || die "dosed failed"
	fi
}

pkg_postinst() {
	elog "If you will be starting mpd via /etc/init.d/mpd, please make"
	elog "sure that MPD's pid_file is set to /var/run/mpd/mpd.pid."

	# also change the homedir if the user has existed before
	usermod -d "/var/lib/mpd" mpd
}
