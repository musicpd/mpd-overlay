# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

SLOT="0"
IUSE="amazon lirc xosd"

DEPEND="=media-sound/gmpc-0.15.4.102
	amazon? ( =media-plugins/gmpc-coveramazon-${PV} )
	=media-plugins/gmpc-autoplaylist-${PV}
	=media-plugins/gmpc-avahi-${PV}
	=media-plugins/gmpc-coveramazon-${PV}
	=media-plugins/gmpc-extraplaylist-${PV}
	=media-plugins/gmpc-favorites-${PV}
	=media-plugins/gmpc-lastfm-${PV}
	=media-plugins/gmpc-libnotify-${PV}
	lirc? ( =media-plugins/gmpc-lirc-0.9 )
	=media-plugins/gmpc-lyrics-${PV}
	=media-plugins/gmpc-magnatune-${PV}
	=media-plugins/gmpc-mdcover-${PV}
	=media-plugins/gmpc-mserver-${PV}
	xosd? ( =media-plugins/gmpc-osd-${PV} )
	=media-plugins/gmpc-qosd-${PV}
	=media-plugins/gmpc-random-playlist-${PV}
	=media-plugins/gmpc-serverstats-${PV}
	=media-plugins/gmpc-shout-${PV}
	=media-plugins/gmpc-stopbutton-${PV}
	=media-plugins/gmpc-wikipedia-${PV}"
RDEPEND="${DEPEND}"
