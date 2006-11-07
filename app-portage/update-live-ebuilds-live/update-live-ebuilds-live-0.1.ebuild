# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="This is a program to update all files from various live repositories in portage"
HOMEPAGE="http://avuton.googlepages.com"
EGIT_REPO_URI="git://olricha.homelinux.net/var/git/update-live-ebuilds.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	insinto /etc
	doins update-live-ebuilds.conf
	dobin update-live-ebuilds
	dodoc README
}
