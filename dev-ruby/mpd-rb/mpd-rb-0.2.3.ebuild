# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

#MY_P="${P/ruby-mpd/mpd-rb}"

DESCRIPTION="Ruby class for communicating with an MPD server"
HOMEPAGE="http://www.andsoforth.com/geek/mpd_rb.html"
SRC_URI="http://rubyforge.org/frs/download.php/8040/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="virtual/ruby"

#S=${WORKDIR}/${MY_P}