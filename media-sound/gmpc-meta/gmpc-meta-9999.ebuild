# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="amazon avahi libnotify lirc xosd"

DEPEND="media-plugins/gmpc-alarm-live
	avahi? ( media-plugins/gmpc-avahi-live )
	amazon? ( media-plugins/gmpc-coveramazon-live )
	media-plugins/gmpc-autoplaylist-live
	media-plugins/gmpc-extraplaylist-live
	media-plugins/gmpc-favorites-live
	media-plugins/gmpc-lastfm-live
	libnotify? ( media-plugins/gmpc-libnotify-live )
	lirc? ( media-plugins/gmpc-lirc-live )
	media-plugins/gmpc-lyrics-live
	media-plugins/gmpc-magnatune-live
	media-plugins/gmpc-mdcover-live
	media-plugins/gmpc-mserver-live
	xosd? ( media-plugins/gmpc-osd-live )
	media-plugins/gmpc-playlistsort-live
	media-plugins/gmpc-qosd-live
	media-plugins/gmpc-random-playlist-live
	media-plugins/gmpc-serverstats-live
	media-plugins/gmpc-stopbutton-live
	media-plugins/gmpc-wikipedia-live"
RDEPEND="${DEPEND}
	!media-plugin/gmpc-amazon-coverart-live"
