# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git eautogen-sh
EGIT_REPO_URI="git://olricha.homelinux.net/var/git/state-utils.git"

DESCRIPTION="A suite of utilities to transfer, restore, save state for the Music Player Daemon."
HOMEPAGE="http://mpd.wikia.com/wiki/Client:State-utils"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"

src_install() {
       dodoc README
       dobin src/state-restore src/state-save src/state-sync
       doman doc/state-restore.1 doc/state-save.1 doc/state-sync.1
}


