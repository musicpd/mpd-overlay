# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_PATCHES="mpd-0.12-conf.patch"
inherit git autotools flag-o-matic
EGIT_REPO_URI="http://musicpd.org/~normalperson/mpd-ke/mpd-ke.git/"

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="aac alsa ao audiofile flac icecast ipv6 jack largefile mikmod mp3 musepack nonblock-update oss pulseaudio unicode vorbis"

DEPEND="${RDEPEND}
	dev-util/gperf
	!sys-cluster/mpich2
	sys-libs/zlib
	aac? ( >=media-libs/faad2-2.0_rc2 )
	audiofile? ( media-libs/audiofile )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4 )
	flac? ( >=media-libs/flac-1.1.2 )
	icecast? ( media-libs/libshout )
	jack? ( media-sound/jack-audio-connection-kit )
	mikmod? ( media-libs/libmikmod )
	mp3? ( media-libs/libmad
	       media-libs/libid3tag )
	musepack? ( media-libs/libmpcdec )
	nls? ( || ( sys-libs/glibc dev-libs/libiconv ) )
	pulseaudio? ( media-sound/pulseaudio )
	vorbis? ( media-libs/libvorbis )"

##	avahi? ( >=net-dns/avahi-0.6 )
##	libsamplerate? ( >=media-libs/libsamplerate-0.0.15 )

RDEPEND="!media-sound/mpd
	!media-sound/mpd-live"

pkg_setup() {
	enewuser mpd '' '' "/var/lib/mpd" audio || die "problem adding user mpd"

	# also change the homedir if the user has existed before
	usermod -d "/var/lib/mpd" mpd
}

src_unpack() {
	git_src_unpack
	epatch ${FILESDIR}/mpd-0.12-conf.patch || die "epatch for config file"
	AT_NOELIBTOOLIZE="yes" AT_M4DIR="${PWD}/m4" eautoreconf
}

src_compile() {
	use largefile && append-flags '-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE'
	econf \
		${myconf} \
		$(use_enable alsa) \
		$(use_enable alsa alsatest) \
		$(use_enable oss) \
		$(use_enable mp3) \
		$(use_enable aac) \
		$(use_enable ao) \
		$(use_enable ao aotest) \
		$(use_enable audiofile) \
		$(use_enable audiofile audiofiletest) \
		$(use_enable flac libFLACtest) \
		$(use_enable flac) \
		$(use_enable flac oggflac) \
		$(use_enable icecast shout) \
		$(use_enable ipv6) \
		$(use_enable jack) \
		$(use_enable mp3) \
		$(use_enable mp3 id3) \
		$(use_enable mikmod libmikmodtest) \
		$(use_enable mikmod mod) \
		$(use_enable musepack mpc) \
		$(use_enable nonblock-update nonblock-update) \
		$(use_enable pulseaudio pulse) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable vorbis vorbistest) \
		|| die "could not configure"

	emake || die "emake failed"
}

src_install() {
	dodir /var/run/mpd
	fowners mpd:audio /var/run/mpd
	fperms 750 /var/run/mpd
	keepdir /var/run/mpd

	emake install DESTDIR=${D} || die
	rm -rf ${D}/usr/share/doc/mpd/
	dodoc ChangeLog INSTALL README TODO UPGRADING
	dodoc doc/COMMANDS doc/mpdconf.example

	insinto /etc
	newins doc/mpdconf.example mpd.conf

	exeinto /etc/init.d
	newexe ${FILESDIR}/mpd-0.12.rc6 mpd

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
