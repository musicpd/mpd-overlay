# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit autotools

DESCRIPTION="WildMidi is a midi processing library and a midi player using the gus patch set. "
HOMEPAGE="http://wildmidi.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE="alsa oss"

DEPEND="alsa? ( media-libs/alsa-lib ) "
RDEPEND="${DEPEND}"

pkg_setup() {
	! use oss && ! use alsa && eerror "Must pick either alsa or oss output"
}

src_prepare() {
	epatch "${FILESDIR}/${PN}_debian_0.2.2-2.diff"
}

src_configure() {
	econf --disable-werror \
		$(use_enable oss)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
