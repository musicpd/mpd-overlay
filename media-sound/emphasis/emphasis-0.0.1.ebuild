# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/kmp/kmp-0.5.ebuild,v 1.2 2006/02/09 13:54:08 caleb Exp $

inherit eutils eautogen-sh

DESCRIPTION="An Etk Media Player Client for MPD"
HOMEPAGE="http://emphasis.tuxfamily.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

SRC_URI="http://emphasis.tuxfamily.org/emphasis.tar.bz2"

DEPEND="|| ( =dev-lib/libmpd-0.12.0 media-libs/libmpd-live)
	=x11-libs/etk-9999"

src_install() {
	emake DESTDIR="${D}" install
}
