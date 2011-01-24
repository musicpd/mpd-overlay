# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

WANT_AUTOMAKE="1.11"

EAPI=2

inherit autotools git gnome2-utils

DESCRIPTION="A GTK+2 client for the Music Player Daemon."
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/GMPC"
EGIT_REPO_URI="git://git.musicpd.org/master/gmpc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="nls xspf"

RDEPEND="sys-libs/zlib
	>=dev-libs/glib-2.16:2
	>=x11-libs/gtk+-2.12:2
	x11-libs/libsexy
	>=gnome-base/libglade-2
	=media-libs/libmpd-9999
	net-libs/libsoup:2.4
	dev-lang/vala:0.12
	dev-db/sqlite:3
	x11-libs/libSM
	x11-libs/libICE
	xspf? ( >=media-libs/libxspf-1.2 )"
DEPEND="${RDEPEND}
	dev-util/gob
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
	econf \
		$(use_enable nls) \
		--disable-dependency-tracking \
		$(use_enable xspf libxspf) \
		--disable-libspiff \
		--enable-system-libsexy \
		--with-extra-version="`git rev-parse ${EGIT_BRANCH} | cut -c 1-8`"

}

src_compile() {
	MAKEOPTS="$MAKEOPTS -j1"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
