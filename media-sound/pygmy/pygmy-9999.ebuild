# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/pygmy/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
inherit distutils subversion

DESCRIPTION="A GTK2 client for the Music Player Daemon (MPD)"
HOMEPAGE="http://pygmy.berlios.de/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
S="${WORKDIR}/${P}"

DEPEND="${RDEPEND}
	dev-python/py-libmpdclient
	dev-python/empy
	>=dev-python/pygtk-2.4.0
	gnome-base/libglade"
