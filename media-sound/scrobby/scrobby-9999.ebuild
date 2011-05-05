# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils autotools git

DESCRIPTION="An Audioscrobbler MPD client"
HOMEPAGE="http://unkart.ovh.org/scrobby"
EGIT_REPO_URI="git://repo.or.cz/scrobby.git"
LICENSE="GPL-2"
IUSE=""

SLOT="0"
KEYWORDS=""

DEPEND="net-misc/curl[ssl,-gnutls]"
RDEPEND="${DEPEND}
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_install() {
	make install DESTDIR="${D}" docdir="${ROOT}/usr/share/doc/${PF}" \
		|| die "install failed"
	newinitd "${FILESDIR}"/scrobby.init scrobby
}

pkg_postinst() {
	elog "Example configuration file has been installed at"
	elog "${ROOT}usr/share/doc/${PF}"
	echo
	elog "You can start scrobby by typing:"
	echo
	elog "/etc/init.d/scrobby start"
	echo
}
