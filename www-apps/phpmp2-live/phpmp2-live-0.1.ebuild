# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/phpMp2/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"

inherit subversion webapp

DESCRIPTION="phpMp2 is another web-based client for MPD"
HOMEPAGE="http://musicpd.org/phpMp2.shtml"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE="gd"

RDEPEND="
	virtual/php
	gd? ( media-libs/gd )
	net-www/apache"

src_install () {
	ewarn "This package is broken for most people, and is only here"
	ewarn "for development or research uses. It also has known security"
	ewarn "issues which is why it was removed from portage proper."
	ewarn "See https://bugs.gentoo.org/show_bug.cgi?id=74951 for more"
	ewarn "information."

	webapp_src_preinst

	dodoc README TODO
	cp -R . ${D}/${MY_HTDOCSDIR}

	webapp_serverowned "${MY_HTDOCSDIR}/config.php"
	webapp_configfile "${MY_HTDOCSDIR}/config.php"

	webapp_src_install
}
