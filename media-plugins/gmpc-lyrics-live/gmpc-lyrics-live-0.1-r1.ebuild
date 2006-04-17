# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://ssl.bulix.org/svn/gmpc-lyrics/trunk/"
ESVN_BOOTSTRAP="autogen.sh"
ESVN_PATCHES="thread2.diff"
inherit subversion

DESCRIPTION="A GMPC plugin to generate playlists based on rules"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="media-sound/gmpc-live net-misc/curl"

src_install()  {
        # This makefile ignores DEST, so manual installation
        insinto "/usr/share/gmpc/plugins"
        doins "src/.libs/lyricsplugin.so"
}
