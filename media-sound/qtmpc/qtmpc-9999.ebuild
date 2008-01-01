# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=1

inherit qt4 eutils subversion

DESCRIPTION="Another QT4 client with Amarok-like tree view music library interface."
HOMEPAGE="http://lowblog.nl/category/qtmpc/"
LICENSE="GPL-2"
ESVN_REPO_URI="http://qtmpc.lowblog.nl/svn"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="${RDEPEND}
	$(qt4_min_version 4.0.0)"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake4 QtMPC.pro || die "eqmake failed"
	emake || die "emake failed"
}

src_install() {
##	Doesn't have an icon yet, waiting for it to
#	make_desktop_entry "${PN}" "QtMPC"
#	newicon images/mn_icon.png ${PN}.png

	dobin QtMPC || die
}
