# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/glurp/branches/glurp-libmpd"
inherit subversion eautogen-sh

DESCRIPTION="Glurp is a GTK2 based graphical client for the Music Player Daemon"
HOMEPAGE="http://sourceforge.net/projects/glurp/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE="debug"

DEPEND="${RDEPEND}
	|| (media-libs/libmpd media-libs/libmpd-live)
	>=x11-libs/gtk+-2.4.0
	>=gnome-base/libglade-2.3.6"
RDEPEND="!media-sound/glurp"

src_compile() {
	eautogen-sh $(use_enable debug) || die
	emake || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog
}