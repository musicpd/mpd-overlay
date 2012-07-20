# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools git-2

DESCRIPTION="A pidgin plugin for MPD"
HOMEPAGE="http://ayeon.org/projects/pidgimpd/"
EGIT_REPO_URI="git://ayeon.org/pidgimpd.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT=0
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/glib:2
	media-libs/libmpd
	net-im/pidgin"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS README TODO )

src_install() {
	default
	find "${ED}" -name "*.la" -exec rm -rf {} + || die "failed to delete .la files"
}
