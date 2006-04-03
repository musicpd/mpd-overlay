# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

ESVN_REPO_URI="https://svn.qballcow.nl/gmpc-osd/trunk/"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

DESCRIPTION="A GMPC plugin to parse and browse online stream lists and files"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="x11-libs/xosd
	media-sound/gmpc-live"

src_install()  {
        # This makefile ignores DEST, so manual installation
        insinto "/usr/share/gmpc/plugins"
        doins "src/.libs/osdplugin.so"
}
