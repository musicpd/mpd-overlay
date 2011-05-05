# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# $Header: $

EAPI=4
inherit autotools git-2

DESCRIPTION="a client for MPD which submits your tracks to last.fm"
HOMEPAGE="http://scmpc.berlios.de/"
EGIT_REPO_URI="git://git.berlios.de/scmpc"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/glib:2
	dev-libs/confuse
	net-misc/curl"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS=( AUTHORS NEWS README scmpc.conf.example )

src_install() {
	default

	newinitd "${FILESDIR}"/${PN}.init ${PN}
	insinto /etc
	insopts -m600
	newins scmpc.conf.example scmpc.conf
}

pkg_postinst() {
	elog "Note: This version of scmpc requires >=mpd-0.14"
}
