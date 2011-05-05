# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="A GMPC plugin to interface jamendo.com API"
KEYWORDS=""
DEPEND="dev-libs/libxml2
	dev-db/sqlite
	sys-libs/zlib"
RDEPEND="${DEPEND}"
