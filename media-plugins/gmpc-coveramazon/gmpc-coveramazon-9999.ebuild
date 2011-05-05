# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="This plugin fetches cover art, and album information from amazon."
KEYWORDS=""
EGIT_REPO_URI="git://repo.or.cz/${PN}.git"
DEPEND="dev-libs/libxml2
	x11-libs/gtk+:2[jpeg]"
