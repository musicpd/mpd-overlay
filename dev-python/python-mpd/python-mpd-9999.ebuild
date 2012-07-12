# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-mpd/python-mpd-0.4.2.ebuild,v 1.1 2012/07/12 14:51:27 angelos Exp $

EAPI=4
PYTHON_COMPAT="python2_6 python2_7 python3_1 python3_2"

inherit git-2 python-distutils-ng

DESCRIPTION="Python MPD client library"
HOMEPAGE="https://github.com/Mic92/python-mpd2"
EGIT_REPO_URI="git://github.com/Mic92/${PN}2.git"

LICENSE="LGPL-3"
KEYWORDS=""
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""

DOCS="CHANGES.txt README.md doc/commands.txt"
