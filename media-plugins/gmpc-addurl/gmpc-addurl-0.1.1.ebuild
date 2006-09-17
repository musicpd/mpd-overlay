# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="A GMPC plugin to simply add an option to insert playlists and urls"
HOMEPAGE="http://cms.qballcow.nl/"
SRC_URI="http://download.qballcow.nl/gmpcurl-${PV}.tar.gz"
GMPC_PLUGIN="liburl"
S="${WORKDIR}/gmpcurl-${PV}"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"
DEPEND="net-misc/curl"
