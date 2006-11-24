# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://www.schleifi.com/svn/florian/kutempc/"
ESVN_BOOTSTRAP="qmake"
inherit subversion

DESCRIPTION="KuteMPC is a QT 4.1+ client heavily inspired by glurp"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"

DEPEND=">x11-libs/qt-4.1.0"

src_install() {
	dobin kutempc
	dodoc TODO
}

