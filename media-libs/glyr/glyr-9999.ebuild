# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils eutils git-2

DESCRIPTION="a music related metadata searchengine, both with commandline interface and C API"
HOMEPAGE="https://github.com/sahib/glyr"
EGIT_REPO_URI="git://github.com/sahib/glyr.git"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="ruby"

RDEPEND="dev-db/sqlite:3
	>=dev-libs/glib-2.16
	net-misc/curl"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use ruby SWIG_RUBY )
	)

	cmake-utils_src_configure
}

src_install() {
	DOCS="AUTHORS CHANGELOG README*"
	cmake-utils_src_install
}
