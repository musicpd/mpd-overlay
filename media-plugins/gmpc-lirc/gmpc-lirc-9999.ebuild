# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

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
