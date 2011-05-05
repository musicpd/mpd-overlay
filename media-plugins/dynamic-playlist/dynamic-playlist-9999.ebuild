# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

CMAKE_IN_SOURCE_BUILD=1
inherit cmake-utils mercurial

DESCRIPTION="Dynamic-playlist will search for similar songs/artists with lastfm or the genre tag."
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
EHG_REPO_URI="http://bitbucket.org/misery/dynamic-playlist"

SLOT=0
S="${WORKDIR}/${PN}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
