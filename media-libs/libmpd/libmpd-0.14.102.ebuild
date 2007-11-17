# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://sarine.nl/libmpd"
LICENSE="GPL-2"
SRC_URI="http://download.sarine.nl/gmpc-0.15.5-rc4/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="doc"
DEPEND="virtual/libc
	!media-libs/libmpd
	>=dev-libs/glib-2
	sys-devel/libtool"
RDEPEND="doc? ( >=app-doc/doxygen-1.4.6 )"
RESTRICT="primaryuri"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"

	use doc && make doc
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	use doc && dohtml -r doc/html/
}
