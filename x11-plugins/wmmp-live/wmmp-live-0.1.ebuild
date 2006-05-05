# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

ESVN_REPO_URI="https://svn.musicpd.org/WMmp/trunk/"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

MY_P=${P/wm/WM}
DESCRIPTION="A Window Maker dock app client for Music Player Daemon(media-sound/mpd)"
HOMEPAGE="http://www.musicpd.org"

DEPEND="virtual/x11 \
	!x11-plugins/wmmp"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~sparc ~alpha ~amd64"

S=${WORKDIR}/${MY_P}

src_install () {
	emake install DESTDIR=${D} || die

	dodoc AUTHORS README THANKS TODO
}
