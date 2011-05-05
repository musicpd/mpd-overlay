# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="This plugin fetches cover art, and album information from amazon."
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
EGIT_REPO_URI="git://repo.or.cz/${PN}.git"
DEPEND="dev-libs/libxml2
	x11-libs/gtk+:2[jpeg]"
