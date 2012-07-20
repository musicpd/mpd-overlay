# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils mercurial

DESCRIPTION="Makes a playlist with last.fm information"
HOMEPAGE="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_DYNAMIC_PLAYLIST"
EHG_REPO_URI="http://bitbucket.org/misery/dynamic-playlist"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=media-sound/gmpc-${PV}"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	sys-devel/gettext"
