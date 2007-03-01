# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils eautogen-sh

DESCRIPTION="An Etk Media Player Client for MPD"
HOMEPAGE="http://emphasis.tuxfamily.org/"
SRC_URI="http://emphasis.tuxfamily.org/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
S="${WORKDIR}/${PN}"

DEPEND="!media-sound/emphasis-live
	|| ( media-libs/libmpd-live >=media-libs/libmpd-0.14.0 )
	=x11-libs/etk-9999"

src_install() {
	emake DESTDIR="${D}" install
}
