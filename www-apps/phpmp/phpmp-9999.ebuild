# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit webapp git-2

MY_PN="phpMp"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="phpMp is a client program for Music Player Daemon (mpd)"
HOMEPAGE="http://www.musicpd.org/"
EGIT_REPO_URI="git://git.musicpd.org/avuton/phpmp.git"

LICENSE="GPL-2"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/httpd-php
	|| ( <dev-lang/php-5.3[pcre] >=dev-lang/php-5.3 )"

need_httpd_cgi

S="${WORKDIR}"/${MY_P}

src_install() {
	webapp_src_preinst

	dodoc ChangeLog README TODO
	rm -f ChangeLog COPYING INSTALL README TODO

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_configfile "${MY_HTDOCSDIR}"/config.php

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install
}
