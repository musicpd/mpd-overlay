# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
EGIT_REPO_URI="git://ngls.zakx.de/scmpc.git"
inherit git autotools

DESCRIPTION="a client for MPD which submits your tracks to last.fm"
HOMEPAGE="http://ngls.zakx.de/scmpc/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

RDEPEND=">=dev-libs/glib-2.16
	>=net-misc/curl-7.15.4
	dev-libs/confuse"

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS NEWS README scmpc.conf.example
	newinitd "${FILESDIR}"/${PN}.init ${PN}
	insinto /etc
	insopts -m600
	newins scmpc.conf.example scmpc.conf
}

pkg_postinst() {
	elog "Note: This version of scmpc requires mpd-0.14"
}
