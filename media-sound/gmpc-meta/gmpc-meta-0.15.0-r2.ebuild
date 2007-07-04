# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

## If you want more keywords; file bugs against b.g.o against the specific
## plugin that needs keyworded against your arch. Will add to this as they
## are available in portage.

KEYWORDS="~sparc ~x86"
SLOT="0"
IUSE="amazon xosd"

DEPEND="=media-sound/gmpc-0.15.1
	amazon? ( =media-plugins/gmpc-coveramazon-${PV} )
	=media-plugins/gmpc-autoplaylist-${PV}
	=media-plugins/gmpc-avahi-${PV}
	=media-plugins/gmpc-coveramazon-${PV}
	=media-plugins/gmpc-lastfm-${PV}
	=media-plugins/gmpc-lyrics-${PV}
	=media-plugins/gmpc-magnatune-${PV}
	=media-plugins/gmpc-mdcover-${PV}
	xosd? ( =media-plugins/gmpc-osd-${PV} )
	=media-plugins/gmpc-qosd-${PV}
	=media-plugins/gmpc-serverstats-${PV}
	=media-plugins/gmpc-shout-${PV}
	=media-plugins/gmpc-stopbutton-${PV}"
RDEPEND="${DEPEND}"
