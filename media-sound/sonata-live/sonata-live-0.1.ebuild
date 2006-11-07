# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/sonata/trunk"

DESCRIPTION="A lightweight music player for MPD, written in Python."
HOMEPAGE="http://sonata.berlios.de/"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"
PROVIDE="media-sound/sonata"
IUSE="gnome"

RDEPEND=">=virtual/python-2.4
	>=dev-python/pygtk-2.6
	!media-sound/sonata
	gnome? ( dev-python/gnome-python-extras )"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
	dodoc COPYING CHANGELOG README TODO TRANSLATORS
}

pkg_postinst() {
	python_version
	python_mod_optimize /usr/lib/python${PYVER}/site-packages
}

pkg_postrm() {
	python_version
	python_mod_cleanup
}
