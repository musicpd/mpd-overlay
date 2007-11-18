# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


inherit distutils

DESCRIPTION="A GTK2 client for the Music Player Daemon (MPD)"
HOMEPAGE="http://pygmy.berlios.de/"
SRC_URI="http://pygmy.berlios.de/files/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
S="${WORKDIR}/${P}"

DEPEND="${RDEPEND} 
	dev-python/py-libmpdclient
	dev-python/empy
	>=dev-python/pygtk-2.4.0
	gnome-base/libglade"
