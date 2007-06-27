# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit subversion webapp eutils depend.php

DESCRIPTION="A web client written in php/AJAX"
HOMEPAGE="http://pitchfork.remiss.org"
ESVN_REPO_URI="svn://pitchfork.remiss.org/pitchfork"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="lighttpd"

RDEPEND=">=dev-lang/php-5.0.0
	dev-php/PEAR-PEAR
	lighttpd? ( www-servers/lighttpd )
	!lighttpd? ( =net-www/apache-2* )"

S="${WORKDIR}/${P}"

pkg_setup() {
	webapp_pkg_setup
	require_php_with_use simplexml json

	if use lighthttpd && ! built_with_use www-serverslighttpd php; then
		die "www-servers/lighttpd must be built with php support for ${P}"
	fi
}

src_install() {
	webapp_src_preinst

	cp -r . "${D}/${MY_HTDOCSDIR}"

	webapp_serverowned -R ${MY_HTDOCSDIR}/config

	webapp_src_install
}
