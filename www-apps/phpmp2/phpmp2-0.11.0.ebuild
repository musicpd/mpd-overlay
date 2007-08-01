# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


MY_PN=${PN/m/M}
inherit mpd-www

DESCRIPTION="phpMp2 is another web-based client for MPD"
HOMEPAGE="http://musicpd.org/phpMp2.shtml"
SRC_URI="http://mercury.chem.pitt.edu/~shank/${MY_PN}-${PV}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="gd"
S="${WORKDIR}/${MY_PN}"
DOC="README TODO"

RDEPEND="
	virtual/php
	virtual/httpd-php
	gd? ( media-libs/gd )"

src_unpack() {
	unpack ${A}
	cd ${S}
	# remove SVN directories
	find . -type d -name '.svn' -print | xargs rm -rf
}

src_install () {
	webapp_serverowned "${MY_HTDOCSDIR}/config.php"
	webapp_configfile "${MY_HTDOCSDIR}/config.php"
	mpd-www_src_install
}
