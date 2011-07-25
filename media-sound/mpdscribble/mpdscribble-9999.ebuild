# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="git://git.musicpd.org/master/mpdscribble.git"
inherit git-2 autotools eutils

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Mpdscribble"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="curl debug"

RDEPEND=">=dev-libs/glib-2.16:2
	=media-libs/libmpdclient-9999
	curl? ( net-misc/curl )
	!curl? ( net-libs/libsoup:2.4 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myclient=soup
	use curl && myclient=curl
	econf \
		--with-http-client-${myclient} \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		$(use_enable debug)
}

src_install() {
	default
	newinitd "${FILESDIR}/mpdscribble.rc" mpdscribble
	dodir /var/cache/mpdscribble
}
