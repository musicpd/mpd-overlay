# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="Python module for interfacing MPD"
SRC_URI="http://pygmy.berlios.de/files/${PN}-${PV}.tar.bz2"
HOMEPAGE="http://www.musicpd.org/py-libmpdclient.shtml"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ppc64 sparc x86"
IUSE=""
RDEPEND="!dev-python/py-libmpdclient-live"
