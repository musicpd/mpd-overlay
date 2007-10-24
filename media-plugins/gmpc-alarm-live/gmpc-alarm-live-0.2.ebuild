# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit subversion autotools

DESCRIPTION="A GMPC plugin for alarm timer action."
HOMEPAGE="http://cms.qballcow.nl/"
LICENSE="GPL-2"
ESVN_REPO_URI="http://svn.brokentrain.net/gmpc-alarm/trunk/"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND="|| ( media-sound/gmpc-live media-sound/gmpc )"

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}