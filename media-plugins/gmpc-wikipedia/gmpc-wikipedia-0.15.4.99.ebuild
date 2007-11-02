# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

GTK_REQUIRES="jpeg"
inherit gmpc-plugin

DESCRIPTION="A GMPC plugin to fetch the wikipedia information for an artist/album."
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"
SRC_URI="http://download.sarine.nl/gmpc-0.15.5-rc1/gmpcwiki-${PV}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

S="gmpcwiki-${PV}"