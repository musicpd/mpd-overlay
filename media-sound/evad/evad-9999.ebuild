# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit python distutils subversion

DESCRIPTION="A text based/ncurses client heavily inspired by ncmpc"
HOMEPAGE="http://www.evadmusic.com"
ESVN_REPO_URI="https://evad.svn.sourceforge.net/svnroot/evad/trunk"
LICENSE="GPL-2"

PYTHON_DEPEND="2"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="dev-lang/python[ncurses]"
RDEPEND="${DEPEND}"

pkg_postinst() {
	python_mod_optimize Evad
}

pkg_postrm() {
	python_mod_cleanup Evad
}
