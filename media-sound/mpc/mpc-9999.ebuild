# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools bash-completion-r1 git-2

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://www.musicpd.org"
EGIT_REPO_URI="git://git.musicpd.org/master/mpc.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="iconv"

RDEPEND="~media-libs/libmpdclient-9999
	iconv? ( virtual/libiconv )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS NEWS README doc/mpd-m3u-handler.sh doc/mppledit
	doc/mpd-pls-handler.sh )

src_configure() {
	econf $(use_enable iconv) \
		--docdir="${EPREFIX}"/usr/share/doc/${PF}
}

src_install() {
	default
	newbashcomp doc/mpc-completion.bash ${PN}
}
