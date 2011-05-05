# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools git

DESCRIPTION="MPD client library"
HOMEPAGE="http://mpd.wikia.com/wiki/ClientLib:libmpdclient"
EGIT_REPO_URI="git://git.musicpd.org/master/libmpdclient.git"
LICENSE="BSD"
IUSE="debug"

SLOT="0"
KEYWORDS=""

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable debug) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
