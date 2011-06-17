# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
WANT_AUTOMAKE="1.11"

inherit git-2 flag-o-matic autotools multilib

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org"
EGIT_REPO_URI="git://git.musicpd.org/master/mpd.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="aac +alsa ao audiofile avahi bzip2 cdio cue +curl debug +fifo +ffmpeg flac
fluidsynth profile +id3 ipv6 jack lame lastfmradio libmms libsamplerate +mad
mikmod modplug mpg123 musepack +network ogg oss pipe pulseaudio sid sndfile sqlite
tcpd twolame unicode vorbis wavpack zip doc"

RDEPEND="!sys-cluster/mpich2
	>=dev-libs/glib-2.4:2
	aac? ( >=media-libs/faad2-2 )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4[alsa?,pulseaudio?] )
	audiofile? ( media-libs/audiofile )
	avahi? ( net-dns/avahi )
	bzip2? ( app-arch/bzip2 )
	cdio? ( dev-libs/libcdio )
	cue? ( >=media-libs/libcue-0.13 )
	curl? ( net-misc/curl )
	ffmpeg? ( virtual/ffmpeg )
	flac? ( media-libs/flac[ogg?] )
	fluidsynth? ( media-sound/fluidsynth )
	id3? ( media-libs/libid3tag )
	jack? ( media-sound/jack-audio-connection-kit )
	lame? ( network? ( media-sound/lame ) )
	libmms? ( >=media-libs/libmms-0.4 )
	libsamplerate? ( media-libs/libsamplerate )
	mad? ( media-libs/libmad )
	mpg123? ( !mad? ( media-sound/mpg123 ) )
	mikmod? ( media-libs/libmikmod )
	modplug? ( media-libs/libmodplug )
	musepack? ( >=media-sound/musepack-tools-444 )
	network? ( >=media-libs/libshout-2
		tcpd? ( sys-apps/tcp-wrappers )
		!lame? ( !vorbis? ( media-libs/libvorbis ) ) )
	ogg? ( media-libs/libogg )
	pulseaudio? ( media-sound/pulseaudio )
	sid? ( >=media-libs/libsidplay-2.1.1-r2:2 )
	sndfile? ( !modplug? ( media-libs/libsndfile ) )
	sqlite? ( dev-db/sqlite:3 )
	twolame? ( media-sound/twolame )
	vorbis? ( media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )
	zip? ( dev-libs/zziplib )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	use network || ewarn "Icecast and Shoutcast streaming needs networking."

	if use fluidsynth; then
		ewarn "Use of fluidsynth USE is highly discouraged by upstream."
		ewarn "Use wildmidi unless you know better."
	fi

	enewuser mpd "" "" "/var/lib/mpd" audio
}

src_prepare() {
	eautoreconf
	cp -f doc/mpdconf.example doc/mpdconf.dist || die "cp failed"
	epatch "${FILESDIR}"/mpdconf.patch || die "mpdconf patch failed"
}

src_configure() {
	local mpdconf="--enable-tcp
		--enable-un
		--disable-wildmidi
		--disable-gme
		--disable-documentation"

	if use network; then
		mpdconf+=" --enable-libwrap --enable-shout $(use_enable vorbis vorbis-encoder)
			--enable-httpd-output $(use_enable lame lame-encoder)"
		if ! use lame && ! use vorbis; then
			ewarn "At least one encoder is required, enabling vorbis for you."
			mpdconf+=" --enable-vorbis-encoder"
		fi
	else
		mpdconf+=" --disable-shout --disable-vorbis-encoder
			--disable-httpd-output --disable-lame-encoder"
	fi

	if use flac && use ogg; then
		mpdconf+=" --enable-oggflac"
	else
		mpdconf+=" --disable-oggflac"
	fi

	if use mad; then
		use mpg123 && \
		ewarn "libmad and libmpg123 are mutually exclusive, use libmad"
		mpdconf+=" --enable-mad --disable-mpg123"
	else
		mpdconf+=" $(use_enable mpg123) --disable-mad"
	fi

	if use modplug; then
		mpdconf+=" --disable-sndfile"
	else
		mpdconf+=" $(use_enable sndfile)"
	fi

	append-lfs-flags
	append-ldflags "-L/usr/$(get_libdir)/sidplay/builders"

	econf \
		$(use_enable ipv6) \
		$(use_enable cue) \
		$(use_enable sqlite) \
		$(use_enable curl) \
		$(use_enable lastfmradio lastfm) \
		$(use_enable libmms mms) \
		$(use_enable bzip2) \
		$(use_enable zip zzip) \
		$(use_enable cdio iso9660) \
		$(use_enable id3) \
		$(use_enable audiofile) \
		$(use_enable ffmpeg) \
		$(use_enable flac) \
		$(use_enable mikmod) \
		$(use_enable modplug) \
		$(use_enable musepack mpc) \
		$(use_enable vorbis) \
		$(use_enable sid sidplay) \
		$(use_enable fluidsynth) \
		$(use_enable wavpack) \
		$(use_enable libsamplerate lsr) \
		$(use_enable twolame twolame-encoder) \
		$(use_enable alsa) \
		$(use_enable ao) \
		$(use_enable fifo) \
		$(use_enable pipe pipe-output) \
		$(use_enable jack) \
		$(use_enable oss) \
		$(use_enable pulseaudio pulse) \
		$(use_enable aac) \
		$(use_enable debug) \
		$(use_enable profile gprof) \
		$(use_with avahi zeroconf avahi) \
		${mpdconf}
}

src_install() {
	dodir /var/run/mpd
	fowners mpd:audio /var/run/mpd
	fperms 750 /var/run/mpd
	keepdir /var/run/mpd

	emake DESTDIR="${D}" install || die "emake install failed"
	rm -rf "${D}"/usr/share/doc/mpd

	dodoc AUTHORS NEWS README UPGRADING doc/mpdconf.dist

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
	dodir /var/log/mpd
	keepdir /var/log/mpd

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
