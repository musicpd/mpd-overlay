# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

CMAKE_IN_SOURCE_BUILD=1
inherit cmake-utils mercurial

DESCRIPTION="Dynamic-playlist will search for similar songs/artists with lastfm or the genre tag."
HOMEPAGE="https://bitbucket.org/misery/dynamic-playlist"
KEYWORDS=""
IUSE=""
LICENSE="GPL-2"
EHG_REPO_URI="http://bitbucket.org/misery/dynamic-playlist"

SLOT=0
S="${WORKDIR}/${PN}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
