# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

ESVN_REPO_URI="https://svn.musicpd.org/phpMp/trunk/"

inherit subversion webapp

DESCRIPTION="phpMp is a client program for Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~sparc ~alpha ~amd64"

DEPEND="virtual/httpd-php"

src_install() {
	webapp_src_preinst

	local docs="COPYING ChangeLog INSTALL README TODO"

	dodoc ${docs}
	for doc in ${docs}; do
			rm -f ${doc}
	done

	cp -r . ${D}${MY_HTDOCSDIR}


	webapp_configfile ${MY_HTDOCSDIR}/config.php

	webapp_postinst_txt en ${FILESDIR}/postinstall-en.txt

	webapp_src_install

	einfo "phpMp-live is installed in your webroot under"
	einfo "/phpmp-live/, you may want to symlink to it"
	einfo "from phpMp or something."
}
