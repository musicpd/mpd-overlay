# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit cmake-utils git-2

DESCRIPTION="A music related metadata searchengine, both with commandline interface and C API"
HOMEPAGE="http://github.com/sahib/glyr"
EGIT_REPO_URI="git://github.com/sahib/glyr.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-db/sqlite:3
	>=dev-libs/glib-2.10
	net-misc/curl"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS README* TODO" # CHANGELOG is obsolete in favour of git history

src_prepare() {
	sed -e 's:-Os -s::' -e 's:-ggdb3::' -i CMakeLists.txt || die
}
