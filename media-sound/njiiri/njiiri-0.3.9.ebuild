# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit ruby

EAPI=2
DESCRIPTION="Njiiri is a GTK+ client for MPD, written in Ruby."
HOMEPAGE="http://www.red-bean.com/decklin/njiiri/"
LICENSE="AS-IS"
SRC_URI="http://www.red-bean.com/decklin/njiiri/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="dev-ruby/ruby-gnome2
	dev-ruby/ruby-libglade2
	dev-ruby/librmpd"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/njiiri || die "dobin failed"

	cd "${S}"/lib
	doruby -r * || die "doruby failed"

	dodir /usr/share/${PN} || die "dodir failed"
	insinto /usr/share/${PN} || die "insinto failed"
	doins "${S}"/share/* || die "Failed to copy shared files"
}