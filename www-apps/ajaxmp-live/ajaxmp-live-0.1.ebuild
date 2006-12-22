# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EDARCS_REPOSITORY="http://mroyer31.hd.free.fr/roy/ajaxmp"
inherit mpd-www

DESCRIPTION="ajaxmp is a web client for MPD"
HOMEPAGE="http://www.musicpd.org/"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE=""

DEPEND="virtual/httpd-php"

DOCS="CHANGELOG README"

pkg_postinst() {
	mpd-www_pkg_postinst

	ewarn "You need to edit config.php.dist and copy it"
	ewarn "to config/config.php before use."
}
