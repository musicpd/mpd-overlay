# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools git-2

DESCRIPTION="A library for interfacing Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://www.musicpd.org"
EGIT_REPO_URI="git://git.musicpd.org/master/libmpdclient.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="doc examples static-libs"

RDEPEND=""
DEPEND="doc? ( app-doc/doxygen )"

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		$(use_enable static-libs static)
}

src_install() {
	default
	use examples && dodoc src/example.c
	use doc || rm -rf "${ED}"/usr/share/doc/${PF}/html
	find "${ED}" -name "*.la" -exec rm -rf {} + || die "failed to delete .la files"
}
