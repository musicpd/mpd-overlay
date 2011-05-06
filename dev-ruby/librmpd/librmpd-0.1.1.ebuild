# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"

inherit ruby-fakegem

DESCRIPTION="Ruby library for communicating with an MPD server"
HOMEPAGE="http://librmpd.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/15722/${P}.gem"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""
