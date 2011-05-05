# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit gnome2-utils subversion autotools

DESCRIPTION="a GTK2 MPD (Music Player Daemon) client inspired by Rythmbox"
HOMEPAGE="http://ario-player.sourceforge.net"
LICENSE="GPL-2"
ESVN_REPO_URI="https://ario-player.svn.sourceforge.net/svnroot/ario-player/trunk"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="audioscrobbler dbus debug idle libnotify nls python taglib zeroconf"

RDEPEND=">=dev-libs/glib-2.14:2
	gnome-base/libglade:2.0
	net-misc/curl
	net-libs/gnutls
	=media-libs/libmpdclient-9999
	>=x11-libs/gtk+-2.12:2
	audioscrobbler? ( net-libs/libsoup:2.4 )
	dbus? ( dev-libs/dbus-glib )
	libnotify? ( x11-libs/libnotify )
	python? ( dev-python/pygtk
		dev-python/pygobject )
	taglib? ( media-libs/taglib )
	zeroconf? ( net-dns/avahi )"
DEPEND="sys-devel/gettext
	dev-util/intltool
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable audioscrobbler) \
		$(use_enable dbus) \
		$(use_enable debug) \
		$(use_enable idle mpdidle) \
		$(use_enable libnotify notify) \
		$(use_enable nls) \
		$(use_enable python) \
		$(use_enable taglib) \
		$(use_enable zeroconf avahi)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
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
