# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools git-2

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://gmpc.wikia.com/wiki/Libmpd"
EGIT_REPO_URI='git://repo.or.cz/libmpd.git'

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND=">=dev-libs/glib-2.16:2
	sys-devel/libtool"
DEPEND="${REDEPEND}
	doc? ( >=app-doc/doxygen-1.4.6 )
	dev-util/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/${PN}-overflow.patch"
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_compile() {
	emake
	use doc && emake doc
}

src_install() {
	emake DESTDIR="${D}" install
	use doc && dohtml -r doc/html/
	dodoc AUTHORS ChangeLog NEWS README
	find "${ED}" -name "*.la" -delete || die "failed to delete .la files"
}
