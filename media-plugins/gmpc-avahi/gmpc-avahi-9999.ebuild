# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gmpc-plugin

DESCRIPTION="A GMPC plugin to find MPD servers and automatically make a profile for it."
KEYWORDS=""
DEPEND="net-dns/avahi"
RDEPEND="${DEPEND}"
IUSE=""
