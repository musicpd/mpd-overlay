# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit eutils subversion autotools
DESCRIPTION="PMS is an ncurses based client."
HOMEPAGE="http://pms.sourceforge.net/"
ESVN_REPO_URI="https://pms.svn.sourceforge.net/svnroot/pms"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE=""

DEPEND="dev-libs/boost
	media-libs/libmpd
	sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
