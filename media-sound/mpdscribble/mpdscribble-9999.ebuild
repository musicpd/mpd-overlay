# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="git://git.musicpd.org/master/mpdscribble.git"
inherit git-2 autotools

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Mpdscribble"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="dev-libs/glib:2
	|| ( >=dev-libs/glib-2.16:2 dev-libs/libgcrypt )
	net-libs/libsoup:2.4
	=media-libs/libmpdclient-9999"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf $(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}/mpdscribble.rc" mpdscribble
	chmod 600 "${D}"/etc/mpdscribble.conf
	dodoc AUTHORS NEWS README
	rm -r -f "${D}"/usr/share/doc/${PN}
	dodir /var/cache/mpdscribble
}
