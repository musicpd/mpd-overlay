# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit git-2 autotools
EGIT_REPO_URI="git://repo.or.cz/state-utils.git"

DESCRIPTION="A suite of utilities to transfer, restore, save state for the Music Player Daemon."
HOMEPAGE="http://mpd.wikia.com/wiki/Client:State-utils"
LICENSE="GPL-3"

KEYWORDS=""
SLOT="0"
IUSE=""

src_prepare() {
	eautoreconf
}

src_install() {
	dodoc README
	dobin src/state-restore src/state-save src/state-sync
	doman doc/state-restore.1 doc/state-save.1 doc/state-sync.1
}
