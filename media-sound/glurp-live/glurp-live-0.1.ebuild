# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE="debug"

ESVN_REPO_URI="https://svn.musicpd.org/glurp/trunk/"
inherit subversion eautogen-sh

DESCRIPTION="Glurp is a GTK2 based graphical client for the Music Player Daemon"
HOMEPAGE="http://sourceforge.net/projects/glurp/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc sparc x86"


DEPEND=">=x11-libs/gtk+-2.4.0
	>=gnome-base/libglade-2.3.6
	!media-sound/glurp"

src_compile() {
	eautogen-sh $(use_enable debug) || die
	emake || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog
}
