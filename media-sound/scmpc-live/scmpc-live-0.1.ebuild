# Copyright 1999-2006 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/scmpc/trunk"
inherit subversion eautogen-sh

IUSE=""
DESCRIPTION="scmpc is yet another audioscrobbler client for MPD"
HOMEPAGE="http://scmpc.berlios.de/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"

RDEPEND="dev-libs/argtable
	dev-libs/confuse
	dev-libs/libdaemon
	net-misc/curl"

DEPEND="${RDEPEND}"

src_install() {
	emake install DESTDIR=${D}
}
