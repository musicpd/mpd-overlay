# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="This is a program to update all files from various live repositories in portage"
HOMEPAGE="http://avuton.googlepages.com"
EGIT_REPO_URI="git://repo.or.cz/ule.git"
LICENSE="GPL-3"

KEYWORDS=""
SLOT="0"
IUSE=""

DEPENDS=">=app-shells/bash-3*
	app-admin/sudo
	sys-apps/findutils"

src_install() {
	insinto /etc/ule
	doins ule.conf
	dobin update-live-ebuilds
	doman doc/update-live-ebuilds.8
}
