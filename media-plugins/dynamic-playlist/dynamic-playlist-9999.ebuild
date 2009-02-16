# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cmake-utils mercurial

DESCRIPTION="Dynamic-playlist will search for similar songs/artists with lastfm or the genre tag."
#KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
## For now, it blocks gmpc and has other problems which will hopefully be  fixed soon.
KEYWORDS="-*"
EHG_REPO_URI="http://bitbucket.org/misery/dynamic-playlist"

SLOT=0
S="${WORKDIR}/${PN}"

src_configure() {
	cmake-utils_src_configurein
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
