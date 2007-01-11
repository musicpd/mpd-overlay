# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A self serving ajax web client for MPD"
HOMEPAGE="http://manatlan.infogami.com/wymypy"
SRC_URI="http://manatlan.free.fr/setup/${PN}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_compile() {
	einfo 'Nothing to compile'
}

src_install() {
	## Totally unorthadox
	dobin "${S}"
	newconfd "${FILESDIR}/wymypy.confd" wymypy
	newinitd "${FILESDIR}/wymypy.initd" wymypy
}

pkg_postinst() {
	elog "Care has gone into making this as secure as possible, please"
	elog "run it using the initscript."
}
