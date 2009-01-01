# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ESVN_REPO_URI="https://svn.musicpd.org/phpMp+/trunk/"
inherit mpd-www

DESCRIPTION="phpMp is a client program for Music Player Daemon (mpd)"
HOMEPAGE="http://mpd.wikia.com"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
DOCS="README"

DEPEND="${RDEPEND}
	virtual/httpd-php"

src_install() {
	mpd-www_src_install

	webapp_configfile ${MY_HTDOCSDIR}/config.inc.php
}
