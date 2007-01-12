# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils eautogen-sh cvs

DESCRIPTION="An Etk Media Player Client for MPD"
HOMEPAGE="http://emphasis.tuxfamily.org/"

ECVS_SERVER="anoncvs.enlightenment.org:/var/cvs/e"
ECVS_MODULE="e17/apps/emphasis"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND="${RDEPEND}
	media-libs/libmpd-live
	=x11-libs/etk-9999"
RDEPEND="!media-sound/emphasis"

S="${WORKDIR}/${ECVS_MODULE}"

src_install() {
	emake DESTDIR="${D}" install
}
