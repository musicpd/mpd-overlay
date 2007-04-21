# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/scmpc/trunk"
inherit subversion autotools

DESCRIPTION="A multithreaded MPD client for Audioscrobbler"
HOMEPAGE="http://scmpc.berlios.de"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND=">=net-misc/curl-7.10.0
	dev-libs/libdaemon
	dev-libs/confuse
	dev-libs/argtable
	!media-sound/scmpc"	
RDEPEND=""

src_unpack() {
        subversion_src_unpack
        eautoreconf
}

src_install() {
   make DESTDIR="${D}" install || die "Install failed!"
}

pkg_postinst() {
   echo
   einfo "You will need to set up your scmpc.conf file before running scmpc"
   einfo "for the first time. An example has been installed in"
   einfo "${ROOT}usr/share/scmpc/scmpc.conf, which can be copied to"
   einfo "${ROOT}etc/scmpc.conf. For more details, please see the scmpc(1)"
   einfo "manual page."
   echo
}
