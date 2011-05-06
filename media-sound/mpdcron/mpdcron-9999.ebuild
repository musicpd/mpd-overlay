# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit autotools git

DESCRIPTION="mpdcron is a 'cron' like program for mpd.  It can execute scripts based on mpd's idle events."
HOMEPAGE="http://repo.or.cz/w/mpdcron.git"
EGIT_REPO_URI="git://repo.or.cz/mpdcron.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="=media-libs/libmpdclient-9999"
DEPEND="${RDEPEND}"

src_prepare() {
	einfo "Running intltoolize --automake"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README mpdcron.example
}
