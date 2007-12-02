# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit python distutils

DESCRIPTION="A text based/ncurses client heavily inspired by ncmpc"
HOMEPAGE="http://www.evadmusic.com"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

pkg_setup() {
	if ! built_with_use 'dev-lang/python' ncurses; then
		eerror "You must build =dev-lang/python with ncurses USE flag."
		die "Please re-emerge =dev-lang/python with ncurses USE flag."
	fi
}

src_compile() {
        distutils_src_compile
}

src_install() {
        distutils_src_install
}

pkg_postinst() {
        python_version
        python_mod_optimize /usr/lib/python${PYVER}/site-packages
}

pkg_postrm() {
        python_version
        python_mod_cleanup
}
