# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

DESCRIPTION="Ruby library for communicating with an MPD server"
HOMEPAGE="http://librmpd.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/15722/${P}.gem"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="!dev-ruby/librmpd-live"
