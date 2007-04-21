# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="Gimmix is a graphical music player daemon (MPD) client written in C using GTK+2."
HOMEPAGE="http://gimmix.berlios.de/"
SRC_URI="http://download.berlios.de/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.10
	>=gnome-base/libglade-2.6
	x11-libs/libnotify
	|| ( media-libs/libmpd-live >=media-libs/libmpd-0.12.0 )
	dev-libs/confuse"

src_compile() {
	econf --disable-dependency-tracking || eerror 'econf failed'
	emake || eerror 'emake failed'
}

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}
