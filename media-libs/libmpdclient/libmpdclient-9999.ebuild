# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools git-2

DESCRIPTION="MPD client library"
HOMEPAGE="http://mpd.wikia.com/wiki/ClientLib:libmpdclient"
EGIT_REPO_URI="git://git.musicpd.org/master/libmpdclient.git"
LICENSE="BSD"
IUSE="examples debug static-libs"

SLOT="0"
KEYWORDS=""

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		$(use_enable debug) \
		$(use_enable static-libs static)
}

src_install() {
	emake install DESTDIR="${D}" || die "emake install failed"
	if use examples; then
		dodoc src/example.c || die "dodoc failed"
	fi
	find "${ED}" -name "*.la" -delete || die "failed to delete .la files"
}
