# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://www.schleifi.com/svn/florian/kutempc/"
ESVN_BOOTSTRAP="qmake"
inherit subversion

DESCRIPTION="KuteMPC is a QT 4.1+ client heavily inspired by glurp"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND=">x11-libs/qt-4.1.0"

src_install() {
	dobin kutempc
	dodoc TODO
}

