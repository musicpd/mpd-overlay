# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="amazon xosd"

DEPEND="amazon? ( media-plugins/gmpc-coveramazon )
	media-plugins/gmpc-autoplaylist
	media-plugins/gmpc-lastfm
	media-plugins/gmpc-lyrics
	media-plugins/gmpc-magnatune
	media-plugins/gmpc-mdcover
	xosd? ( media-plugins/gmpc-osd )
	media-plugins/gmpc-qosd
	media-plugins/gmpc-serverstats
	media-plugins/gmpc-stopbutton"
RDEPEND="${DEPEND}
	!media-plugins/gmpc-amazon-coverart"