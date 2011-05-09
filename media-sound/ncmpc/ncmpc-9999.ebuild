# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools

DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Ncmpc"
LICENSE="GPL-2"
EGIT_REPO_URI="git://git.musicpd.org/cirrus/ncmpc.git"

KEYWORDS=""
SLOT="0"
IUSE="artist-screen +colors debug +help-screen key-screen lirc lyrics-screen mouse nls minimal outputs-screen search-screen song-screen +wcwidth"

RDEPEND=">=dev-libs/glib-2.4
	dev-libs/popt
	=media-libs/libmpdclient-9999
	sys-libs/ncurses
	lirc? ( app-misc/lirc )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
	glib-gettextize --force --copy
}

src_configure() {
	econf \
		--docdir=/usr/share/doc/${PF} \
		--disable-dependency-tracking \
		$(use_enable nls multibyte) \
		$(use_enable nls locale) \
		$(use_enable nls) \
		$(use_enable colors) \
		$(use_enable lirc) \
		$(use_enable help-screen) \
		$(use_enable mouse) \
		$(use_enable artist-screen) \
		$(use_enable search-screen) \
		$(use_enable sond-screen) \
		$(use_enable key-screen) \
		$(use_enable lyrics-screen) \
		$(use_enable outputs-screen) \
		$(use_enable minimal mini) \
		$(use_enable debug) \
		$(use_enable wcwidth wide) \
		$(use_with lyrics-screen lyrics-plugin-dir /usr/$(get_libdir)/ncmpc/lyrics)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS NEWS README doc/*.sample
}
