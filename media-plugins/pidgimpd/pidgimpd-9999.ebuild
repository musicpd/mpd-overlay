# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

ESVN_REPO_URI="https://svn.ayeon.org/pidgimpd/trunk/"
inherit subversion autotools

DESCRIPTION="A pidgin plugin for MPD"
HOMEPAGE="http://ayeon.org/projects/pidgimpd/"
KEYWORDS=""
LICENSE="GPL-2"
SLOT=0

IUSE="debug"

DEPEND="net-im/pidgin"
RDEPEND="${DEPEND}"
IUSE=""

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable debug) || 'Configure failed.'
}

src_install() {
	emake install DESTDIR="${D}" || die
}
