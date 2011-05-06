# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp eutils depend.php cvs

DESCRIPTION="A web client written in php/AJAX"
HOMEPAGE="http://orangeplayer.sourceforge.net/"
ECVS_SERVER="orangeplayer.cvs.sourceforge.net:/cvsroot/orangeplayer"
ECVS_MODULE="orangeplayer"
LICENSE="GPL-2"
IUSE=""

KEYWORDS=""

RDEPEND="virtual/httpd-php"

S="${WORKDIR}"/"${P}"

pkg_setup() {
	webapp_pkg_setup

	if has_version 'dev-lang/php'; then
		require_php_with_use simplexml json session
	fi
}

src_install() {
	webapp_src_preinst

	cd "${WORKDIR}/${PN}"

	cp -r . "${D}/${MY_HTDOCSDIR}"

	webapp_src_install
}
