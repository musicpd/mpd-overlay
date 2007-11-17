# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A Gnome client for the Music Player Daemon."
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"
SRC_URI="http://download.sarine.nl/gmpc-0.15.5-rc4/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="mmkeys session trayicon"

RDEPEND=">=x11-libs/gtk+-2.8
	>=dev-libs/glib-2.10
	>=gnome-base/libglade-2.3
	session? ( x11-libs/libSM )
	dev-perl/XML-Parser
	|| ( =media-libs/libmpd-0.14.102 media-libs/libmpd-live )
	>dev-util/gob-2
	!media-sound/gmpc
	net-misc/curl
	dev-util/intltool"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

RESTRICT="primaryuri"

src_compile() {
	econf \
		$(use_enable mmkeys) \
		$(use_enable session sm) \
		$(use_enable trayicon) || die "autogen.sh failed!"
	emake || die "Make failed!"
}
src_install() {
	make DESTDIR=${D} install || die "make install failed"
}

DOCS="AUTHORS ChangeLog NEWS README"
