# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"
inherit ruby-ng

DESCRIPTION="Ruby class for communicating with an MPD server"
HOMEPAGE="http://rubyforge.org/projects/mpd/"
SRC_URI="http://rubyforge.org/frs/download.php/8040/${P}.tar.gz"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

each_ruby_install() {
	${RUBY} setup.rb install --prefix="${D}/usr" || die "setup.rb failed"
}

each_ruby_configure() {
	${RUBY} setup.rb config --prefix="${D}/usr" || die "setup.rb failed"
}
