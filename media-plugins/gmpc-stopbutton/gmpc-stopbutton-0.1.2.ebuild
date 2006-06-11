# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A GMPC plugin to simply put a stop button in the main window"
HOMEPAGE="http://etomite.qballcow.nl/"
SRC_URI="http://xeon.ele.tue.nl/~qball/Code/gmpc/plugins/gmpc-stopbutton-${PV}.tar.gz"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="media-sound/gmpc-live"

src_install()  {
        # This makefile ignores DEST, so manual installation
        insinto "/usr/share/gmpc/plugins"
        doins "src/.libs/libstopbutton.so"
}
