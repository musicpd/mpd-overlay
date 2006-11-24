# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin eautogen-sh

## Due to upcoming magnatune plugin breakage
ESVN_OPTIONS="-r 5080"
DESCRIPTION="A GMPC plugin to interface magnatune.com streams."
HOMEPAGE="http://sarine.nl/gmpc"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"
