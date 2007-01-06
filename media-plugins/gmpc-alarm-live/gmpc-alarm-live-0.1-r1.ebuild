# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="http://svn.brokentrain.net/gmpc-alarm/trunk/"
ESVN_PATCHES="${FILESDIR}/new-api-fix.diff"
GMPC_DOCS="AUTHORS TODO README"
inherit subversion eautogen-sh

DESCRIPTION="A GMPC plugin for alarm timer action."
HOMEPAGE="http://cms.qballcow.nl/"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"

src_install() {
	insinto "/usr/share/gmpc/plugins"
	doins "src/.libs/alarmplugin.so"

	if [[ -n ${GMPC_DOCS} ]]; then
		dodoc ${GMPC_DOCS}
	fi
}
