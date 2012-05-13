# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gmpc-plugin

DESCRIPTION="The plugin allows you to browse, and preview available albums on www.magnatune.com."
KEYWORDS=""
DEPEND="dev-libs/libxml2
	dev-db/sqlite
	|| ( x11-libs/gdk-pixbuf:2[jpeg] x11-libs/gtk+:2[jpeg] )"
RDEPEND="${DEPEND}"
IUSE=""
