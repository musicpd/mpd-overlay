# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit git autotools

DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:Ncmpc&oldid=5100"
LICENSE="GPL-2"
EGIT_REPO_URI="git://git.musicpd.org/cirrus/ncmpc.git"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="clock-screen mouse search-screen key-screen raw-mode nls debug"

DEPEND="sys-libs/ncurses
	dev-libs/popt
	>=dev-libs/glib-2.4"

pkg_setup() {
	use search-screen && elog "Please note that the search-screen is experimental"
}

src_prepare() {
	AT_M4DIR="${S}/m4" eautoreconf
}

src_configure() {
	econf \
		$(use_enable clock-screen) \
		$(use_enable debug) \
		$(use_enable mouse) \
		$(use_enable key-screen) \
		$(use_enable search-screen) \
		$(use_with nls) \
		$(use_with raw-mode) || die "econf failed"
}

src_install() {
	make install DESTDIR="${D}" docdir="/usr/share/doc/${PF}" \
		|| die "install failed"
}
