# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit git-2 autotools

DESCRIPTION="A Window Maker dock app client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:WMmp"
EGIT_REPO_URI="git://git.musicpd.org/master/wmmp.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libXext
	x11-libs/libXpm"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P/wm/WM}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --with-default-port=6600
}

src_install () {
	emake install DESTDIR="${D}"

	dodoc AUTHORS ChangeLog README THANKS TODO
}
