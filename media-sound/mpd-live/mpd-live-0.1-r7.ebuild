# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ESVN_REPO_URI="https://svn.musicpd.org/mpd/trunk/"
ESVN_PATCHES="mpdconf.patch"

inherit subversion autotools flag-o-matic

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="aac alsa ao audiofile avahi bonjour fifo flac icecast iconv ipv6 jack largefile libsamplerate mp3 mikmod musepack ogg oss pulseaudio unicode vorbis wavpack"

DEPEND="!sys-cluster/mpich2
	!media-sound/mpd
	!media-sound/mpd-ke
	aac? ( >=media-libs/faad2-2.0_rc2 )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4 )
	audiofile? ( media-libs/audiofile )
	avahi? ( net-dns/avahi )
	bonjour? ( net-misc/mDNSResponder )
	flac? ( media-libs/flac )
	icecast? ( media-libs/libshout )
	iconv? ( virtual/libiconv )
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
	if use avahi && use bonjour; then
		eerror "MPD can only be built with Avahi OR Bonjour support, not both."
		die "Both avahi and bonjour in USE."
	fi

	if use ogg && use flac && ! built_with_use media-libs/flac ogg; then
		eerror "To be able to play OggFlac files you need to build"
		eerror "media-libs/flac with +ogg, to build libOggFLAC."
		die "Missing libOggFLAC library."
	fi

	enewuser mpd "" "" "/var/lib/mpd" audio || die "problem adding user mpd"
}

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" AT_M4DIR="${PWD}/m4" eautoreconf
}

src_compile() {
	use largefile && append-flags '-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE'

	local myconf

	myconf=""

	if use avahi; then
		myconf="${myconf} --with-zeroconf=avahi"
	elif use bonjour; then
		myconf="${myconf} --with-zeroconf=bonjour"
	else
		myconf="${myconf} --with-zeroconf=no"
	fi

	if use ogg && use flac; then
		myconf="${myconf} --enable-oggflac --enable-libOggFLACtest"
	else
		myconf="${myconf} --disable-oggflac --disable-libOggFLACtest"
	fi

	econf \
		$(use_enable aac) \
		$(use_enable alsa) \
		$(use_enable alsa alsatest) \
		$(use_enable ao) \
		$(use_enable ao aotest) \
		$(use_enable audiofile) \
		$(use_enable audiofile audiofiletest) \
		$(use_enable fifo) \
		$(use_enable flac) \
		$(use_enable flac libFLACtest) \
		$(use_enable icecast shout) \
		$(use_enable iconv) \
		$(use_enable ipv6) \
		$(use_enable jack) \
		$(use_enable libsamplerate lsr) \
		$(use_enable mp3) \
		$(use_enable mp3 id3) \
		$(use_enable mikmod mod) \
		$(use_enable mikmod libmikmodtest) \
		$(use_enable musepack mpc) \
		$(use_enable oss) \
		$(use_enable ogg oggtest) \
		$(use_enable pulseaudio pulse) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable vorbis vorbistest) \
		$(use_enable wavpack) \
		${myconf} || die "could not configure"

	emake || die "emake failed"
}

src_install() {
	dodir /var/run/mpd
	fowners mpd:audio /var/run/mpd
	fperms 750 /var/run/mpd
	keepdir /var/run/mpd

	emake install DESTDIR="${D}" || die
	rm -rf "${D}"/usr/share/doc/mpd/
	dodoc AUTHORS ChangeLog INSTALL README TODO UPGRADING
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
