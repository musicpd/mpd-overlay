# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="https://svn.musicpd.org/ncmpc/trunk/"
inherit subversion autotools

DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://www.musicpd.org/?page=ncmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="clock-screen mouse search-screen key-screen raw-mode nls debug"

DEPEND="virtual/libc
        sys-libs/ncurses
        dev-libs/popt
        >=dev-libs/glib-2.4
	!media-sound/ncmpc-tradiaz"

pkg_setup() {
	use search-screen && einfo "Please note that the search-screen is experimental"
}

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	AT_M4DIR="${S}/m4" eautoreconf
}

src_compile() {
	econf $(use_enable clock-screen) \
		$(use_enable debug) \
		$(use_enable mouse) \
		$(use_enable key-screen) \
		$(use_enable search-screen) \
		$(use_with nls) \
		$(use_with raw-mode) || die "econf failed"

		emake || die "emake failed"
}

src_install() {
       make install DESTDIR=${D} docdir=/usr/share/doc/${PF} \
               || die "install failed"

       prepalldocs
}
