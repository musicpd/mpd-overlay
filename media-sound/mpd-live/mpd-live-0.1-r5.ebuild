# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/mpd/trunk/"
ESVN_PATCHES="mpd-svn5142-avahi.patch mpd-0.12.1-unpack.patch mpd-0.12-conf.patch"
inherit subversion eautogen-sh flag-o-matic

DESCRIPTION="The Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="aac alsa ao audiofile avahi bzip2 flac icecast ipv6 jack largefile mikmod mp3 musepack oss
pulseaudio unicode vorbis zlib"

DEPEND="${RDEPEND}
	dev-util/gperf
	!sys-cluster/mpich2
	sys-libs/zlib
	aac? ( >=media-libs/faad2-2.0_rc2 )
	alsa? ( media-sound/alsa-utils )
	ao? ( >=media-libs/libao-0.8.4 )
	audiofile? ( media-libs/audiofile )
	avahi? ( >=net-dns/avahi-0.6 )
	bzip2? ( app-arch/bzip2 )
	flac? ( >=media-libs/flac-1.1.2 )
	icecast? ( media-libs/libshout )
	jack? ( media-sound/jack-audio-connection-kit )
	mp3? ( media-libs/libmad
	       media-libs/libid3tag )
	mikmod? ( media-libs/libmikmod )
	musepack? ( media-libs/libmpcdec )
	pulseaudio? ( media-sound/pulseaudio )
	vorbis? ( media-libs/libvorbis )
	zlib? ( sys-libs/zlib )"

RDEPEND="!media-sound/mpd
	!media-sound/mpd-ke"

pkg_setup() {
	enewuser mpd '' '' "/var/lib/mpd" audio || die "problem adding user mpd"

	# also change the homedir if the user has existed before
	usermod -d "/var/lib/mpd" mpd
}

src_compile() {
	use largefile && append-flags '-D_FILE_OFFSET_BITS=64'
	eautogen-sh \
		${myconf} \
		$(use_enable alsa) \
		$(use_enable alsa alsatest) \
		$(use avahi && echo '--with-zeroconf=avahi' || echo '--with-zeroconf=no') \
		$(use_enable oss) \
		$(use_enable mp3) \
		$(use_enable aac) \
		$(use_enable ao) \
		$(use_enable ao aotest) \
		$(use_enable audiofile) \
		$(use_enable audiofile audiofiletest) \
		$(use_enable bzip2 bzip2) \
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
		$(use_enable pulseaudio pulse) \
		$(use_enable vorbis oggvorbis) \
		$(use_enable vorbis vorbistest) \
		$(use_enable zlib zlib) \
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

pkg_postinst() {
	elog "If you are upgrading from 0.11.x, check the configuration file carefully,"
	elog "the format has changed. See the example config file installed as"
	elog "/usr/share/doc/${PF}/mpdconf.example.gz, and mpd.conf manual page."
	elog ""
	elog "Please make sure that MPD's pid_file is set to /var/run/mpd/mpd.pid."
}
