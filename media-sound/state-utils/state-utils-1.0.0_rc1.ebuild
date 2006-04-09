# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/_/-}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="A suite of utilities to transfer, restore, save state for the Music Player Daemon."
HOMEPAGE="http://mpd.wikia.com/wiki/Client:State-utils"
SRC_URI="http://musicpd.org/~avuton/state-utils/state-utils-1.0.0-rc1.tar.bz2"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}

