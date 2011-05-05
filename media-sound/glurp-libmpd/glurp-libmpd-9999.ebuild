# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
ESVN_REPO_URI="https://svn.musicpd.org/glurp/branches/glurp-libmpd"
inherit subversion autotools

DESCRIPTION="Glurp is a GTK2 based graphical client for the Music Player Daemon"
HOMEPAGE="http://sourceforge.net/projects/glurp/"
LICENSE="GPL-2"

KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="media-libs/libmpd
	>=x11-libs/gtk+-2.4.0
	!media-sound/glurp
	>=gnome-base/libglade-2.3.6"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable debug) || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog
}
