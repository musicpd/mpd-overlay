# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit autotools git

DESCRIPTION="MPD client library"
HOMEPAGE="http://mpd.wikia.com/wiki/ClientLib:libmpdclient"
EGIT_REPO_URI="git://git.musicpd.org/master/libmpdclient.git"
LICENSE="BSD"
IUSE="debug"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable debug) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
