# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="This is a LIRC plugin for GMPC"
LICENSE="GPL-2"

KEYWORDS=""
SLOT="0"
IUSE=""

src_compile() {
	PKG_CONFIG_PATH="." econf || die
	emake || die
}
