# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="amazon xosd"

DEPEND="amazon? ( =media-plugins/gmpc-coveramazon-0.14.95 )
	=media-plugins/gmpc-autoplaylist-0.14.95
	=media-plugins/gmpc-avahi-0.0.5
	=media-plugins/gmpc-coveramazon-0.14.95
	=media-plugins/gmpc-lastfm-0.14.95
	=media-plugins/gmpc-lyrics-0.14.95
	=media-plugins/gmpc-magnatune-0.14.95
	=media-plugins/gmpc-mdcover-0.14.95
	xosd? ( =media-plugins/gmpc-osd-0.14.95 )
	=media-plugins/gmpc-qosd-0.14.95
	=media-plugins/gmpc-serverstats-0.14.95
	=media-plugins/gmpc-shout-0.14.95
	=media-plugins/gmpc-stopbutton-0.14.95"
RDEPEND="${DEPEND}
	!media-plugins/gmpc-amazon-coverart"
