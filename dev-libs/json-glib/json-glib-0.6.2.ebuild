# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A library providing serialization and deserialization support for the JavaScript Object Notation (JSON) format."
HOMEPAGE="http://live.gnome.org/JsonGlib"
SRC_URI="http://folks.o-hand.com/~ebassi/sources/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="doc"

DEPEND=">=dev-libs/glib-2.15
	doc? ( dev-util/gtk-doc )"
RDEPEND="${DEPEND}"

src_compile() {
	econf $(use_enable gtk-doc) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
