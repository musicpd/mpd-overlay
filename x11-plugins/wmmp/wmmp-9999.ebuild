# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit subversion autotools

DESCRIPTION="A Window Maker dock app client for Music Player Daemon(media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:WMmp&oldid=941"
LICENSE="GPL-2"

ESVN_REPO_URI="https://svn.musicpd.org/WMmp/trunk/"
KEYWORDS=""
SLOT="0"
IUSE=""
S="${WORKDIR}/${P/wm/WM}"

DEPEND="x11-libs/libXext
	x11-libs/libXpm"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install () {
	emake install DESTDIR=${D} || die

	dodoc AUTHORS README THANKS TODO
}
