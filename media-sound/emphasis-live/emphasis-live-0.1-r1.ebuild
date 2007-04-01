# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils cvs autotools

ECVS_SERVER="anoncvs.enlightenment.org:/var/cvs/e"
ECVS_MODULE="e17/apps/emphasis"

DESCRIPTION="An Etk Media Player Client for MPD"
HOMEPAGE="http://emphasis.tuxfamily.org/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
S="${WORKDIR}/${ECVS_MODULE}"

DEPEND="${RDEPEND}
	|| ( media-libs/libmpd-live media-libs/libmpd )
	=x11-libs/etk-9999"
RDEPEND="!media-sound/emphasis"

src_unpack() {
	cvs_src_unpack
	cd "${S}"
	eautoreconf	
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install
}
