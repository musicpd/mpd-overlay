# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GMPC_SVN_ROOT="gmpc-coveramazon"
GMPC_PLUGIN="caaplugin"
ESVN_BOOTSTRAP="autogen.sh"
inherit gmpc-plugin

DESCRIPTION="A GMPC plugin to retrieve coverart from amazon.com"
HOMEPAGE="http://cms.qballcow.nl/"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="net-misc/curl"
