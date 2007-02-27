# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="This is a program to update all files from various live repositories in portage"
HOMEPAGE="http://avuton.googlepages.com"
EGIT_REPO_URI="git://olricha.homelinux.net/var/git/update-live-ebuilds.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPENDS=">=app-shells/bash-3*'
	sys-apps/findutils"

src_install() {
	insinto /etc
	doins update-live-ebuilds.conf
	dobin update-live-ebuilds
	dodoc README
}
