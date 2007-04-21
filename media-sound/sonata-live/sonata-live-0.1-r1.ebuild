# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


inherit distutils subversion

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/sonata/trunk"

DESCRIPTION="A lightweight music player for MPD, written in Python."
HOMEPAGE="http://sonata.berlios.de/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="gnome"

RDEPEND=">=virtual/python-2.4
	>=dev-python/pygtk-2.6
	!media-sound/sonata
	gnome? ( dev-python/gnome-python-extras )"

pkg_setup() {
	if ! built_with_use '=x11-libs/gtk+-2*' jpeg; then
		echo
		ewarn "If you want album cover art displayed in Sonata,"
		ewarn "you must build gtk+-2.x with \"jpeg\" USE flag."
		die "enable jpeg use flag"
	fi
}

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
