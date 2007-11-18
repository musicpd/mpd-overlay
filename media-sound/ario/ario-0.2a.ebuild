# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit gnome2 autotools

DESCRIPTION="A MPD client with an Rhythmbox inspired interface."
HOMEPAGE="http://ario-player.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}-player/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND="gnome-base/libgnomeui
	gnome-base/libglade
	gnome-base/eel
	net-misc/curl
	media-libs/libmpd"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch "${FILESDIR}/build-fix.patch"

	gnome2_omf_fix

	AT_NOELIBTOOLIZE="yes" AT_M4DIR="${PWD}/m4" eautoreconf
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}
