# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils autotools git-2

DESCRIPTION="Glurp is a GTK2 based graphical client for the Music Player Daemon"
HOMEPAGE="http://sourceforge.net/projects/glurp/"
EGIT_REPO_URI="git://git.musicpd.org/master/glurp.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="x11-libs/gtk+:2
	>=dev-libs/glib-2.4:2
	>=media-libs/libmpd-0.17"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog )

src_configure() {
	econf \
		$(use_enable debug)
}

src_install() {
	default
	doicon "${FILESDIR}"/${PN}.svg
	make_desktop_entry glurp Glurp glurp AudioVideo
}
