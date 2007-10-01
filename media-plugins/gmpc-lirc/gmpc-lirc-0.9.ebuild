# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EGIT_REPO_URI="http://musicpd.org/~avuton/gmpc-lirc.git"
EGIT_BRANCH="stable"

inherit git autotools

DESCRIPTION="This is a LIRC plugin for GMPC"
HOMEPAGE="http://igor.tla.ro/projects/gmpc_lirc_plugin"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
DEPEND="app-misc/lirc"

src_unpack() {
	git_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	PKG_CONFIG_PATH="." econf || die
	emake || die
}

src_install() {
	make DESTDIR="${D}" install
}
