# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_AUTOMAKE="1.11"

EAPI=3

inherit autotools git-2 gnome2-utils

DESCRIPTION="A GTK+2 client for the Music Player Daemon."
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/GMPC"
EGIT_REPO_URI="git://git.musicpd.org/master/gmpc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="nls unique xspf"

RDEPEND=">=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.12:2
	x11-libs/libsexy
	>=gnome-base/libglade-2
	=media-libs/libmpd-9999
	net-libs/libsoup:2.4
	dev-db/sqlite:3
	unique? ( dev-libs/libunique:1 )
	xspf? ( >=media-libs/libxspf-1.2 )"
DEPEND="${RDEPEND}
	dev-lang/vala:0.10
	>=dev-util/gob-2.0.17
	dev-util/pkgconfig
	nls? ( dev-util/intltool
		sys-devel/gettext )"

export VALAC=$(type -p valac-0.12)

src_prepare() {
	einfo "Running intltoolize --automake"
	intltoolize --force --copy --automake || die "intltoolize failed"
	eautoreconf || die "eautoreconf Failed"
}

src_configure() {
	VALAC=$(type -p valac-0.10) \
	econf \
		--disable-dependency-tracking \
		$(use_enable unique) \
		$(use_enable nls) \
		$(use_enable xspf libxspf) \
		--disable-libspiff \
		--enable-system-libsexy \
		--with-extra-version="$(git rev-parse ${EGIT_BRANCH} | cut -c 1-8)"
}

src_install() {
	emake DESTDIR="${ED}" install || die
	dodoc AUTHORS ChangeLog NEWS README
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
