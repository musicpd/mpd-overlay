# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/pygmy/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
inherit distutils subversion

S="${WORKDIR}/${P}"
DESCRIPTION="A GTK2 client for the Music Player Daemon (MPD)"
HOMEPAGE="http://pygmy.berlios.de/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"

DEPEND="dev-python/py-libmpdclient-live
	dev-python/empy"
