# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git eautogen-sh
EGIT_REPO_URI="git://olricha.homelinux.net/var/git/state-utils.git"

DESCRIPTION="A suite of utilities to transfer, restore, save state for the Music Player Daemon."
HOMEPAGE="http://mpd.wikia.com/wiki/Client:State-utils"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"

src_install() {
       dodoc README ChangeLog TODO COPYING
       dobin src/state-restore src/state-save src/state-sync
       doman doc/state-restore.1 doc/state-save.1 doc/state-sync.1
}


