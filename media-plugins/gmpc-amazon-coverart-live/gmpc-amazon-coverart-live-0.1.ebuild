# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/gmpc/gmpc-0.12.0-r1.ebuild,v 1.8 2005/11/11 23:26:32 hansmi Exp $

IUSE="gnome"

ESVN_REPO_URI="https://svn.qballcow.nl/gmpc-coveramazon/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

DESCRIPTION="A GMPC plugin to retrieve coverart from amazon.com"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="net-misc/curl
	media-sound/gmpc-svn"

src_install()  {
	dodir "/usr/share/gmpc/plugins"
	# Hacky, but if you know a better way send a patch.
	cp -av src/.libs/*.so ${D}/usr/share/gmpc/plugins
}
