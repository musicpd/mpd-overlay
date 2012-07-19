# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
MY_P=${P/wm/WM}
inherit autotools git-2

DESCRIPTION="A Window Maker dock app client for Music Player Daemon(media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:WMmp"
EGIT_REPO_URI="git://git.musicpd.org/master/${PN}.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

DOCS=( AUTHORS ChangeLog README THANKS TODO )

src_configure() {
	econf --with-default-port=6600
}

src_compile() {
	emake LDFLAGS="${LDFLAGS}"
}
