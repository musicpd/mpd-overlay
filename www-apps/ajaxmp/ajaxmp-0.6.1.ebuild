# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/phpmp/phpmp-0.11.0.ebuild,v 1.4 2006/01/10 02:50:37 rl03 Exp $

IUSE=""

inherit webapp

DESCRIPTION="ajaxmp is a web client for MPD"
HOMEPAGE="http://www.musicpd.org/"
SRC_URI="http://mroyer31.hd.free.fr/ajaxmp/ajaxmp-0.6.1.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~sparc ~alpha ~amd64"

DEPEND="virtual/httpd-php"

src_install() {
	webapp_src_preinst

	local docs="CHANGELOG README"

	dodoc ${docs}
	for doc in ${docs}; do
			rm -f ${doc}
	done

	cp -r . ${D}${MY_HTDOCSDIR}


	webapp_configfile ${MY_HTDOCSDIR}/config/config.php

	webapp_src_install

	einfo "ajaxmp is installed in your webroot under"
	einfo "/ajaxmp"
	echo ""
	local configfile="${D}${MY_HTDOCSDIR}/config/config.php"
	if [[ ! -f $configfile ]]; then
		ewarn "You need to edit $configfile and copy it"
		ewarn "to config/config.php"
	fi
}
