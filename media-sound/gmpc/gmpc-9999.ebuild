# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit autotools git gnome2-utils

DESCRIPTION="A GTK+2 client for the Music Player Daemon."
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/GMPC"
EGIT_REPO_URI="git://repo.or.cz/gmpc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="nls +session xspf"

RDEPEND=">=dev-libs/glib-2.10:2
	dev-perl/XML-Parser
	>=gnome-base/libglade-2.3
	>=media-libs/libmpd-0.17.1
	net-libs/libsoup:2.4
	net-misc/curl
	>=x11-libs/gtk+-2.12:2
	x11-libs/libsexy
	session? ( x11-libs/libSM )
	xspf? ( >=media-libs/libxspf-1.2 )"
DEPEND="${RDEPEND}
	dev-util/gob
	dev-util/intltool
	dev-util/pkgconfig
	sys-devel/gettext"

src_prepare() {
	einfo "Running intltoolize --automake"
	intltoolize --automake || die "intltoolize failed"
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable session sm) \
		$(use_enable xspf libxspf) \
		--enable-system-libsexy \
		--disable-shave \
		--with-extra-version="`git rev-parse ${EGIT_BRANCH} | cut -c 1-8`"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
