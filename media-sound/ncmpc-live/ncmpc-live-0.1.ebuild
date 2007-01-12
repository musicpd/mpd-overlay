# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/ncmpc/trunk/"
inherit subversion eautogen-sh

IUSE="clock-screen mouse search-screen key-screen raw-mode nls debug"
DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://www.musicpd.org/?page=ncmpc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="virtual/libc
        sys-libs/ncurses
        dev-libs/popt
        >=dev-libs/glib-2.4
	!media-sound/ncmpc
	!media-sound/ncmpc-tradiaz-live"

pkg_setup() {
	        use search-screen && einfo "Please note that the search-screen is
			experimental"
}

src_compile() {
	eautogen-sh $(use_enable clock-screen) \
		$(use_enable debug) \
		$(use_enable mouse) \
		$(use_enable key-screen) \
		$(use_enable search-screen) \
		$(use_with nls) \
		$(use_with raw-mode)

		emake || die "make failed"
}																																	

src_install() {
       make install DESTDIR=${D} docdir=/usr/share/doc/${PF} \
               || die "install failed"

       prepalldocs
}
