# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="https://svn.musicpd.org/ncmpc/branches/tradiaz/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

S="${WORKDIR}/${P}"
IUSE="artist-screen clock-screen debug mouse key-screen lyrics-screen search-screen nls raw-mode"
DESCRIPTION="A branch for fixes and enhancements to ncmpc, a client for the Music Player Daemon (MPD)"
HOMEPAGE="http://www.musicpd.org/?page=ncmpc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"

RDEPEND="virtual/libc
        sys-libs/ncurses
        dev-libs/popt
        >=dev-libs/glib-2.4
	net-misc/curl
	!media-sound/ncmpc
	!media-sound/ncmpc-live"
DEPEND="${RDEPEND}"

pkg_setup() {
	        use search-screen && einfo "Please note that the search-screen is
			experimental"
}

src_compile() {
	econf 	$(use_enable artist-screen) \
		$(use_enable clock-screen) \
		$(use_enable debug) \
		$(use_enable mouse) \
		$(use_enable key-screen) \
		$(use_enable lyrics-screen) \
		$(use_enable search-screen) \
		$(use_with nls) \
		$(use_with raw-mode)

		emake || die "make failed"
}																																	

src_install() {
	dobin src/ncmpc
	dodoc AUTHORS \
		ChangeLog \
		NEWS \
		README \
		TODO \
		doc/config.sample \
		doc/keys.sample \
		doc/ncmpc.lirc
	doman doc/ncmpc.1
}
