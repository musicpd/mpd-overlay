# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit mpd-www

DESCRIPTION="neompc is a php client specifically geared toward small screens"
HOMEPAGE="http://www.pixelhum.com/neompc/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND="${RDEPEND}
	virtual/httpd-php"
