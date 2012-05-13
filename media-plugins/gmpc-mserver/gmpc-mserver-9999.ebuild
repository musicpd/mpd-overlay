# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit gmpc-plugin

DESCRIPTION="This plugin allows seamless file transfers from the host which GMPC is on."
KEYWORDS=""
DEPEND="media-libs/taglib
	net-libs/libmicrohttpd"
RDEPEND="${DEPEND}"
IUSE=""
