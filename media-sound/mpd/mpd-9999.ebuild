# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit eutils git flag-o-matic autotools

EGIT_REPO_URI="git://repo.or.cz/mpd-mk.git"

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="aac alsa ao audiofile avahi ffmpeg fifo flac icecast ipv6 jack libsamplerate mp3 mikmod musepack ogg oss pulseaudio sysvipc unicode vorbis wavpack"

DEPEND="!sys-cluster/mpich2
	>=sys-devel/automake-1.9
	>=dev-libs/glib-2.4:2
	aac? ( >=media-libs/faad2-2.0_rc2 )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4 )
	audiofile? ( media-libs/audiofile )
	avahi? ( net-dns/avahi )
	curl? ( net-misc/curl )
	ffmpeg? ( media-video/ffmpeg )
	flac? ( media-libs/flac )
	icecast? ( media-libs/libshout )
	jack? ( media-sound/jack-audio-connection-kit )
	libsamplerate? ( media-libs/libsamplerate )
	mp3? ( media-libs/libmad
	       media-libs/libid3tag )
	mikmod? ( media-libs/libmikmod )
	musepack? ( media-libs/libmpcdec )
	ogg? ( media-libs/libogg )
	pulseaudio? ( media-sound/pulseaudio )
	vorbis? ( media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )"

pkg_setup() {
	if use ogg && use flac && ! built_with_use media-libs/flac ogg; then
		eerror "To be able to play OggFlac files you need to build"
		eerror "media-libs/flac with +ogg, to build libOggFLAC."
		die "Missing libOggFLAC library."
	fi

	enewuser mpd "" "" "/var/lib/mpd" audio || die "problem adding user mpd"
}

src_prepare() {
	AT_NOELIBTOOLIZE="yes" eautoreconf
	epatch "${FILESDIR}"/mpdconf.patch || die "epatch for config file failed"
}

src_configure() {
	local myconf

	myconf=""

	if use avahi; then
		myconf="${myconf} --with-zeroconf=avahi"
	else
		myconf="${myconf} --with-zeroconf=no"
	fi

	if use ogg && use flac; then
		myconf="${myconf} --enable-oggflac --enable-libOggFLACtest"
	else
		myconf="${myconf} --disable-oggflac --disable-libOggFLACtest"
	fi

	if use icecast && use mp3; then
		myconf="${myconf} --enable-shout_mp3"
	else
		myconf="${myconf} --disable-shout_mp3"
	fi

	if use icecast && use ogg; then
		myconf="${myconf} --enable-shout_ogg"
	else
		myconf="${myconf} --disable-shout_ogg"
	fi

	append-lfs-flags

	econf \
		$(use_enable aac) \
		$(use_enable alsa) \
		$(use_enable ao) \
		$(use_enable audiofile) \
		$(use_enable curl) \
		$(use_enable fifo) \
		$(use_enable ffmpeg) \
		$(use_enable flac) \
		$(use_enable ipv6) \
		$(use_enable jack) \
		$(use_enable libsamplerate lsr) \
		$(use_enable mp3) \
		$(use_enable mp3 id3) \
		$(use_enable mikmod mod) \
		$(use_enable musepack mpc) \
		$(use_enable oss) \
		$(use_enable pulseaudio pulse) \
		$(use_enable sysvipc un) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable wavpack) \
		${myconf} || die "could not configure"
}

src_install() {
	dodir /var/run/mpd
	fowners mpd:audio /var/run/mpd
	fperms 750 /var/run/mpd
	keepdir /var/run/mpd

	emake install DESTDIR="${D}" || die
	rm -rf "${D}"/usr/share/doc/mpd/
	dodoc AUTHORS INSTALL NEWS README TODO UPGRADING
	dodoc doc/COMMANDS doc/mpdconf.example

	insinto /etc
	newins doc/mpdconf.example mpd.conf

	newinitd "${FILESDIR}"/mpd.rc mpd

	if use unicode; then
		dosed 's:^#filesystem_charset.*$:filesystem_charset "UTF-8":' /etc/mpd.conf
	fi
	diropts -m0755 -o mpd -g audio
	dodir /var/lib/mpd/music
	keepdir /var/lib/mpd/music
	dodir /var/lib/mpd/playlists
	keepdir /var/lib/mpd/playlists
	dodir /var/log/mpd
	keepdir /var/log/mpd

	use alsa && \
		dosed 's:need :need alsasound :' /etc/init.d/mpd
}

pkg_postinst() {
	elog "If you will be starting mpd via /etc/init.d/mpd initscript, please make"
	elog "sure that MPD's pid_file is set to /var/run/mpd/mpd.pid."

	# also change the homedir if the user has existed before
	usermod -d "/var/lib/mpd" mpd
}
