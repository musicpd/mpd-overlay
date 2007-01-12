# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GMPC_SVN_ROOT="coveramazon"
inherit gmpc-plugin eautogen-sh

DESCRIPTION="A gmpc plugin that fetches cover art and album information from amazon."
HOMEPAGE="http://sarine.nl/amazon-provider"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"

pkg_setup() {
	if ! built_with_use '=gtk+-2*' jpeg; then
		eerror "You must build gtk+-2.x with jpeg USE flag."
		die "Please re-emerge gtk+-2.x with jpeg USE flag."
	fi
}
