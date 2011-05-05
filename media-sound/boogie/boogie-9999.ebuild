# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit distutils git python

DESCRIPTION="A lightweight console based MPD client"
HOMEPAGE="http://github.com/alip/boogie/tree/master"
EGIT_REPO_URI="git://github.com/alip/boogie.git"
IUSE="zsh-completion"
PYTHON_DEPEND="2"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"

RDEPEND="dev-python/python-mpd
	dev-python/mako
	dev-python/ipython"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="AUTHORS README"

src_install() {
	dodoc ${DOCS}
	doman doc/boogie.1
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		doins zsh-completion/_boogie
	fi
	distutils_src_install
}
