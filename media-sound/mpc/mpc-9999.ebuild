# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
EGIT_REPO_URI="git://git.musicpd.org/master/mpc.git"
inherit git autotools bash-completion

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://mpd.wikia.com/index.php?title=Client:Mpc&oldid=4111"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="+iconv"

RDEPEND="iconv? ( virtual/libiconv )"
DEPEND="${RDEPEND}
	=media-libs/libmpdclient-9999"

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
