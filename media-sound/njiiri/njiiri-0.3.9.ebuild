# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18"
inherit ruby-ng

DESCRIPTION="Njiiri is a GTK+ client for MPD, written in Ruby."
HOMEPAGE="http://www.red-bean.com/decklin/njiiri/"
LICENSE="as-is"
SRC_URI="http://www.red-bean.com/decklin/njiiri/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~ia64 ~mips ~ppc ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="dev-ruby/ruby-gnome2
	dev-ruby/ruby-libglade2
	dev-ruby/librmpd"
RDEPEND="${DEPEND}"

each_ruby_install() {
	dobin bin/njiiri || die "dobin failed"

	cd "${S}"/lib
	doruby -r * || die "doruby failed"

	dodir /usr/share/${PN} || die "dodir failed"
	insinto /usr/share/${PN} || die "insinto failed"
	doins "${S}"/share/* || die "Failed to copy shared files"
}
