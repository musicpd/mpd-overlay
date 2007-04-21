# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="https://svn.musicpd.org/phpMp2/trunk/"
inherit mpd-www

DESCRIPTION="phpMp2 is another web-based client for MPD"
HOMEPAGE="http://musicpd.org/phpMp2.shtml"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="gd"

RDEPEND="virtual/php
	gd? ( media-libs/gd )
	net-www/apache"

src_install () {
	webapp_serverowned "${MY_HTDOCSDIR}/config.php"
	webapp_configfile "${MY_HTDOCSDIR}/config.php"

	mpd-www_src_install
}
