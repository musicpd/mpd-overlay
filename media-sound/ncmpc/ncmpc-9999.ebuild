# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools multilib git-2

DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Ncmpc"
EGIT_REPO_URI="git://git.musicpd.org/cirrus/ncmpc.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="artist-screen colors debug +help-screen key-screen lirc lyrics-screen mouse nls search-screen song-screen"

RDEPEND=">=dev-libs/glib-2.12:2
	~media-libs/libmpdclient-9999
	sys-libs/ncurses
	lirc? ( app-misc/lirc )
	nls? ( sys-libs/ncurses[unicode] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS NEWS README doc/config.sample doc/keys.sample )

src_configure() {
	# upstream lirc doesn't have pkg-config file wrt #250015
	if use lirc; then
		export LIBLIRCCLIENT_CFLAGS="-I/usr/include/lirc"
		export LIBLIRCCLIENT_LIBS="-llirc_client"
	fi

	# use_with lyrics-screen is for multilib
	econf \
		--docdir=/usr/share/doc/${PF} \
		$(use_enable nls multibyte) \
		$(use_enable nls locale) \
		$(use_enable nls) \
		$(use_enable colors) \
		$(use_enable lirc) \
		$(use_enable help-screen) \
		$(use_enable mouse) \
		$(use_enable artist-screen) \
		$(use_enable search-screen) \
		$(use_enable song-screen) \
		$(use_enable key-screen) \
		$(use_enable lyrics-screen) \
		$(use_enable debug) \
		$(use_with lyrics-screen lyrics-plugin-dir /usr/$(get_libdir)/ncmpc/lyrics)
}
