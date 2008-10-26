# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

MY_PN="QtMPC"
MY_P="${MY_PN}-${PV}"

inherit qt4 eutils

DESCRIPTION="Another QT4 client with Amarok-like tree view music library interface."
HOMEPAGE="http://qtmpc.lowblog.nl"
LICENSE="GPL-2"
SRC_URI="http://files.lowblog.nl/${PN}/${MY_P}.tar.bz2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="${RDEPEND}
	>=x11-libs/qt-4.3.0:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	eqmake4 QtMPC.pro || die "eqmake failed"
	emake || die "emake failed"
}

src_install() {
	newicon images/icon.svg "${MY_PN}.svg"
	make_desktop_entry "${MY_PN}" "${MY_PN}" "${MY_PN}"

	dobin QtMPC || die
}
