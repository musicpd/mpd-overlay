# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit webapp eutils depend.php

DESCRIPTION="A web client written in php/AJAX"
HOMEPAGE="http://pitchfork.remiss.org"
SRC_URI="http://pitchfork.remiss.org/files/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-lang/php-5.0.0
	dev-php/PEAR-PEAR
	net-www/apache"

S="${WORKDIR}/${P}"

pkg_setup() {
	webapp_pkg_setup
	require_php_with_use simplexml json
}

src_install() {
	webapp_src_preinst

	cp -r . "${D}/${MY_HTDOCSDIR}"

	webapp_configfile ${MY_HTDOCSDIR}/config
	webapp_serverowned -R ${MY_HTDOCSDIR}/config

	webapp_src_install
}
