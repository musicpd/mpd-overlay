# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/www/viewcvs.gentoo.org/raw_cvs/gentoo-x86/www-apps/phpmp2/Attic/phpmp2-0.11.0.ebuild,v 1.5 2006/08/01 23:23:40 rl03 dead $

ESVN_REPO_URI="https://svn.musicpd.org/phpMp2/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"

inherit subversion webapp

#MY_PN=${PN/m/M}
DESCRIPTION="phpMp2 is another web-based client for MPD"
HOMEPAGE="http://musicpd.org/phpMp2.shtml"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
#S=${WORKDIR}/${MY_PN}

IUSE="gd"

RDEPEND="
	virtual/php
	gd? ( media-libs/gd )
	net-www/apache"

src_unpack() {
#	ewarn "This package is broken for most people, and is only here"
#	ewarn "for development or research uses. It also has known security"
#	ewarn "issues which is why it was removed from portage proper."
#	ewarn "See https://bugs.gentoo.org/show_bug.cgi?id=74951 for more"
#	ewarn "information."

	unpack ${A}
	cd ${S}
	# remove SVN directories
	find . -type d -name '.svn' -print | xargs rm -rf
}

src_install () {
	webapp_src_preinst

	dodoc README TODO
	cp -R . ${D}/${MY_HTDOCSDIR}

	webapp_serverowned "${MY_HTDOCSDIR}/config.php"
	webapp_configfile "${MY_HTDOCSDIR}/config.php"

	webapp_src_install
}
