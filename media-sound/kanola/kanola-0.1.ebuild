# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A lightweight client for MPD, in PyQt 4"
HOMEPAGE="http://dadexter.googlepages.com/kanola"
SRC_URI="http://dadexter.googlepages.com/kanola-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"

RDEPEND=">=virtual/python-2.4
	>=dev-python/PyQt4
	kde-base/pykde"

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
