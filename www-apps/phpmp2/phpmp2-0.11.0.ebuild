# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mpd-www

MY_PN=${PN/m/M}
DESCRIPTION="phpMp2 is another web-based client for MPD"
HOMEPAGE="http://musicpd.org/phpMp2.shtml"
SRC_URI="http://mercury.chem.pitt.edu/~shank/${MY_PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
S=${WORKDIR}/${MY_PN}

IUSE="gd"

RDEPEND="
	virtual/php
	gd? ( media-libs/gd )
	net-www/apache"

src_unpack() {
	unpack ${A}
	cd ${S}
	# remove SVN directories
	find . -type d -name '.svn' -print | xargs rm -rf
}

DOC="README TODO"

src_install () {
	webapp_serverowned "${MY_HTDOCSDIR}/config.php"
	webapp_configfile "${MY_HTDOCSDIR}/config.php"
	mpd-www_src_install
}
