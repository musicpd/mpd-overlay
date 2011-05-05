# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GMPC_PLUGIN="gmpc-last.fm"
inherit gmpc-plugin

DESCRIPTION="The last.fm plugin can fetch artist images, from last.fm. This plugin doesn't scrobble your music, use a dedicated client like mpdscribble for this."
LICENSE="GPL-2"
DEPEND="dev-libs/libxml2
	x11-libs/gtk+:2[jpeg]"

KEYWORDS=""
SLOT="0"
IUSE=""
