# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.ayeon.org/gaimpd/trunk/"
ESVN_BOOTSTRAP="autoconf"
inherit subversion

DESCRIPTION="A gaim plugin for MPD"
HOMEPAGE="http://etomite.qballcow.nl/qgmpc-0.12.html"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND="net-im/gaim \
	media-libs/libmpd-live"

src_install() {
	emake install DESTDIR=${D} || die
}
