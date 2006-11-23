# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

inherit webapp

DESCRIPTION="ajaxmp is a web client for MPD"
HOMEPAGE="http://www.musicpd.org/"
SRC_URI="http://mroyer31.hd.free.fr/ajaxmp/ajaxmp-0.6.1.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="virtual/httpd-php"

MY_PN="ajaxmp"
S=${WORKDIR}/${MY_PN}

src_install() {
	webapp_src_preinst

	local docs="CHANGELOG README"

	pwd
	dodoc ${docs}
	for doc in ${docs}; do
			rm -f ${doc}
	done

	cp -r . ${D}${MY_HTDOCSDIR}

	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postinst
	einfo "ajaxmp is installed in your webroot under"
	einfo "/${MY_PN}"

	echo ""

	ewarn "You need to edit config.php.dist and copy it"
	ewarn "to config/config.php before use."
}
