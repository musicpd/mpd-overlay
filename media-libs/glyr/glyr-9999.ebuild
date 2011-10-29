# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils cmake-utils git-2

DESCRIPTION="a music related metadata searchengine, both with commandline interface and C API"
HOMEPAGE="https://github.com/sahib/glyr"
EGIT_REPO_URI="git://github.com/sahib/glyr.git"

LICENSE="LGPL-2.1"
KEYWORDS=""
SLOT="0"
IUSE="ruby"

DEPEND=">=dev-libs/glib-2.16:2
	net-misc/curl"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use ruby SWIG_RUBY )
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

}
