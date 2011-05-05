# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="gmpc - a meta ebuild to pull in gmpc and all plugins"
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS=""
SLOT="0"
IUSE="avahi awn libnotify lirc taglib guitartabs"

DEPEND="=media-plugins/gmpc-alarm-9999
	avahi? ( =media-plugins/gmpc-avahi-9999 )
	awn? ( =media-plugins/gmpc-awn-9999 )
	=media-plugins/gmpc-discogs-9999
	=media-plugins/gmpc-albumview-9999
	=media-plugins/gmpc-fullscreeninfo-9999
	=media-plugins/gmpc-jamendo-9999
	=media-plugins/gmpc-last-fm-9999
	guitartabs? ( =media-plugins/gmpc-guitartabs-9999 )
	libnotify? ( =media-plugins/gmpc-libnotify-9999 )
	lirc? ( =media-plugins/gmpc-lirc-9999 )
	=media-plugins/gmpc-lyrdb-9999
	=media-plugins/gmpc-lyrics-9999
	=media-plugins/gmpc-lyricwiki-9999
	=media-plugins/gmpc-magnatune-9999
	=media-plugins/gmpc-mdcover-9999
	=media-plugins/gmpc-mserver-9999
	=media-plugins/gmpc-playlistsort-9999
	=media-plugins/gmpc-qosd-9999
	taglib? ( =media-plugins/gmpc-tagedit-9999 )"
RDEPEND="${DEPEND}"
