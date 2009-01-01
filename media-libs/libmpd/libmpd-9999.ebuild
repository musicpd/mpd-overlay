# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit autotools git

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/Libmpd"
LICENSE="GPL-2"
EGIT_REPO_URI='git://repo.or.cz/libmpd.git'

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="doc"
RDEPEND=">=dev-libs/glib-2.16:2
	sys-devel/libtool"
DEPEND="${REDEPEND}
	doc? ( >=app-doc/doxygen-1.4.6 )
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_compile() {
	emake || die "emake failed"

	use doc && make doc
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	use doc && dohtml -r doc/html/
	dodoc AUTHORS ChangeLog NEWS README
}
