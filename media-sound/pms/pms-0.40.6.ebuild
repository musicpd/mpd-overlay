# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit eutils
DESCRIPTION="PMS is an ncurses based client."
HOMEPAGE="http://pms.sourceforge.net/"
SRC_URI="mirror://sourceforge/pms/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE=""

DEPEND="dev-libs/boost
	media-libs/libmpd
	sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/pms-ncurses-fix.patch || die "epatch failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS COPYING README INSTALL TODO  || die "dodoc failed"
	doman pms.1 || die "doman failed"
}
