# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

S="${WORKDIR}/${P}"
DESCRIPTION="A GTK2 client for the Music Player Daemon (MPD)"
HOMEPAGE="http://pygmy.berlios.de/"
SRC_URI="http://pygmy.berlios.de/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="${RDEPEND} 
	dev-python/py-libmpdclient-live
	dev-python/empy
	>=dev-python/pygtk-2.4.0
	gnome-base/libglade"
RDEPEND="!media-sound/pygmy-live"
