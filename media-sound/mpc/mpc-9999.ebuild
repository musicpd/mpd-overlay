# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
EGIT_REPO_URI="git://git.musicpd.org/jat/mpc.git"
inherit git autotools bash-completion

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:Mpc&oldid=4111"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="nls"

DEPEND="virtual/libc
	dev-util/gperf
	nls? ( || ( sys-libs/glibc dev-libs/libiconv ) )"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-dependency-tracking \
		$(use_enable nls iconv) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	mv -v doc/m3u-handler.sh doc/mpd-m3u-handler
	mv -v doc/pls-handler.sh doc/mpd-pls-handler
	dobin doc/mpd-m3u-handler
	dobin doc/mpd-pls-handler
	dobin src/mpc
	dodoc AUTHORS INSTALL README doc/mppledit

	dobashcompletion doc/mpc-bashrc
}
