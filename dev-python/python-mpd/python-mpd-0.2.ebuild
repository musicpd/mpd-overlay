# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="A python mpd library build for speed and simplicity."
HOMEPAGE="http://www.musicpd.org/~jat/python-mpd/"
SRC_URI="http://pypi.python.org/packages/source/p/python-mpd/python-mpd-0.2.0.tar.bz2"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"
