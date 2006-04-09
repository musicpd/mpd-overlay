# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A suite of utilities to transfer, restore, save state for the Music Player Daemon."
HOMEPAGE=""
SRC_URI="http://68.111.224.150:8080/${PN}/state-utils-1.0.0-rc1.tar.bz2"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"

MY_P="state-utils-1.0.0-rc1"
S="${WORKDIR}/${MY_P}"

# This package actually has no dependencies
DEPEND=""

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}

