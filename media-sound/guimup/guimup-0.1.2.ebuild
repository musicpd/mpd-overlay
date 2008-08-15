# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="A GTK+ user interface for the music player daemon"
HOMEPAGE="http://www.coonsden.com/main.htm"
LICENSE="GPL-2"
## Homepage doesn't allow wget downloads; I personally host the same tarball
SRC_URI="http://anpmech.com/~sbh/${PN/g/G}-${PV}src.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="dev-cpp/cairomm
	dev-cpp/glibmm
	dev-cpp/gtkmm
	dev-libs/atk
	media-libs/freetype
	x11-libs/pixman
	x11-libs/pango"
RDEPEND="${DEPEND}"
RESTRICT="primaryuri"

S="${WORKDIR}/${PN/g/G}-${PV}src"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
