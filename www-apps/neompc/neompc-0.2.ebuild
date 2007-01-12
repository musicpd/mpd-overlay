# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mpd-www

DESCRIPTION="neompc is a php client specifically geared toward small screens"
HOMEPAGE="http://www.pixelhum.com/neompc/"
IUSE=""

SRC_URI="http://www.pixelhum.com/downloads/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

S="${WORKDIR}/${PN}"

DEPEND="${RDEPEND}
	virtual/httpd-php"
