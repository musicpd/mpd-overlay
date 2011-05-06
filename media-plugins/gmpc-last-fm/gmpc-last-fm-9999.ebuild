# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GMPC_PLUGIN="gmpc-last.fm"
inherit gmpc-plugin

DESCRIPTION="The last.fm plugin can fetch artist images, from last.fm."
LICENSE="GPL-2"
DEPEND="dev-libs/libxml2
	x11-libs/gtk+:2[jpeg]"
RDEPEND="${DEPEND}"
IUSE=""

KEYWORDS=""
SLOT="0"

pkg_postinst() {
	einfo "This plugin doesn't scrobble your music, use a dedicated client like mpdscribble for this."
}
