# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="Album View for GMPC"
KEYWORDS=""
DEPEND="x11-libs/gtk+:2[jpeg]"
RDEPEND="${DEPEND}"
IUSE=""

src_prepare() {
	intltoolize
	eautoreconf
}
