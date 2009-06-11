# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=2

inherit distutils git python

DESCRIPTION="A lightweight console based MPD client"
HOMEPAGE="http://github.com/alip/boogie/tree/master"
EGIT_REPO_URI="git://github.com/alip/boogie.git"
IUSE="zsh-completion"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"

RDEPEND=">=virtual/python-2.4
	dev-python/python-mpd
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
