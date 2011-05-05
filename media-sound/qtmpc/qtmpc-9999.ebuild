# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

MY_PN="QtMPC"

inherit cmake-utils subversion

DESCRIPTION="Another QT4 client with Amarok-like tree view music library interface."
HOMEPAGE="http://qtmpc.lowblog.nl"
LICENSE="GPL-2"
ESVN_REPO_URI="http://qtmpc.lowblog.nl/svn/trunk"

KEYWORDS=""
SLOT="0"
IUSE="kde"
RDEPEND="x11-libs/qt-gui:4
	kde? ( kde-base/kdelibs )"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs="$(cmake-utils_use kde WANT_KDE_SUPPORT)"
	eerror "cmakeargs: ${mycmakeargs}"
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	## It appears .svgz doesn't work for some reason
	newicon images/icon.svg "${MY_PN}.svg"

	make_desktop_entry "${MY_PN}" "${MY_PN}" "${MY_PN}"
}
