# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="https://svn.musicpd.org/mpd/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

S="${WORKDIR}/${P}"

IUSE="aac alsa ao audiofile fifo flac icecast ipv6 mad mikmod mp3 musepack oss
pulseaudio unicode vorbis"

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://musicpd.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 fbsd ppc sparc alpha hppa mips"

DEPEND="dev-util/gperf
        !media-sound/mpd
	!media-sound/mpd-svn
        sys-libs/zlib
        aac? ( >=media-libs/faad2-2.0_rc2 )
        alsa? ( media-libs/alsa-lib )
        ao? ( >=media-libs/libao-0.8.4 )
        audiofile? ( media-libs/audiofile )
        flac? ( >=media-libs/flac-1.1.0 )
        icecast? ( media-libs/libshout )
        mad? ( media-libs/libmad
               media-libs/libid3tag )
        mikmod? ( media-libs/libmikmod )
        musepack? ( media-libs/libmpcdec )
	pulseaudio? ( media-sound/pulseaudio )
        vorbis? ( media-libs/libvorbis )"

RDEPEND="!media-sound/mpd \
	!media-sound/mpd-svn"

upgrade_warning() {
        echo
        ewarn "This package now correctly uses 'vorbis' USE flag, instead of 'ogg'."
        ewarn "See http://bugs.gentoo.org/show_bug.cgi?id=101877 for details."
        echo
        ewarn "Home directory of user mpd, as well as default locations in mpd.conf have"
        ewarn "been changed to /var/lib/mpd, please bear that in mind while updating"
        ewarn "your mpd.conf file."
        echo
        epause 7
}

pkg_setup() {
        upgrade_warning
        enewuser mpd '' '' "/var/lib/mpd" audio || die "problem adding user mpd"

        # also change the homedir if the user has existed before
        usermod -d "/var/lib/mpd" mpd
}


src_compile() {
        econf \
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
		$(use_enable oggflac) \
                $(use_enable icecast shout) \
                $(use_enable ipv6) \
                $(use_enable mikmod libmikmodtest) \
                $(use_enable mikmod mod) \
                $(use_enable musepack mpc) \
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
        newexe ${FILESDIR}/mpd.rc6 mpd

        if use unicode; then
                dosed 's:^#filesystem_charset.*$:filesystem_charset "UTF-8":' /etc/mpd.conf
        fi
        dosed 's:^#user.*$:user "mpd":' /etc/mpd.conf
        dosed 's:^#bind.*$:bind_to_address "localhost":' /etc/mpd.conf
        dosed 's:^port.*$:port "6600":' /etc/mpd.conf
        dosed 's:^music_directory.*$:music_directory "/var/lib/mpd/music":' /etc/mpd.conf
        dosed 's:^playlist_directory.*$:playlist_directory "/var/lib/mpd/playlists":' /etc/mpd.conf
        dosed 's:^log_file.*$:log_file "/var/log/mpd.log":' /etc/mpd.conf
        dosed 's:^error_file.*$:error_file "/var/log/mpd.error.log":' /etc/mpd.conf
        dosed 's:^pid_file.*$:pid_file "/var/run/mpd/mpd.pid":' /etc/mpd.conf
        dosed 's:^db_file.*:db_file "/var/lib/mpd/database":' /etc/mpd.conf
        dosed 's:^#state_file.*$:state_file "/var/lib/mpd/state":' /etc/mpd.conf
        diropts -m0755 -o mpd -g audio
        dodir /var/lib/mpd/music
        keepdir /var/lib/mpd/music
        dodir /var/lib/mpd/playlists
        keepdir /var/lib/mpd/playlists
        insinto /var/log
        touch ${T}/blah
        insopts -m0640 -o mpd -g audio
        newins ${T}/blah mpd.log
        newins ${T}/blah mpd.error.log
        use alsa && \
                dosed 's:need :need alsasound :' /etc/init.d/mpd
}

pkg_postinst() {
        echo
        einfo "The default config now binds the daemon strictly to localhost,"
        einfo "rather than to all available IPs."
        echo
        if ! use ao ; then
                ewarn "As you're not using libao for audio output, you need to"
                ewarn "adjust audio_output sections in /etc/mpd.conf to use"
                ewarn "ALSA or OSS. See"
                ewarn "/usr/share/doc/${PF}/mpdconf.example.gz."
                echo
        fi
        einfo "Please make sure that MPD's pid_file is set to /var/run/mpd/mpd.pid."
        echo
        ewarn "Note that this is just a development version of Music Player Daemon,"
        ewarn "so if you want to report any bug to MPD developers, please state this fact in"
        ewarn "your bug report, as well as the fact that you used a ${P} Gentoo ebuild."
        upgrade_warning
}
