# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
EGIT_REPO_URI="git://git.musicpd.org/master/mpc.git"
inherit git-2 autotools bash-completion

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:Mpc&oldid=4111"
LICENSE="GPL-2"

KEYWORDS=""
SLOT="0"
IUSE="+iconv"

RDEPEND="iconv? ( virtual/libiconv )
	=media-libs/libmpdclient-9999"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-dependency-tracking \
		$(use_enable iconv) \

}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	dodoc AUTHORS NEWS README
	dodoc doc/mpd-m3u-handler.sh doc/mppledit doc/mpd-pls-handler.sh
	rm -rf "${D}"/usr/share/doc/${PN}

	dobashcompletion doc/mpc-completion.bash
}
