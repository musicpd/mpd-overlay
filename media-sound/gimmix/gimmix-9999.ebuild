# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="svn://svn.berlios.de/gimmix/trunk/src"
inherit subversion autotools

DESCRIPTION="Gimmix is a graphical music player daemon (MPD) client written in C using GTK+2."
HOMEPAGE="http://gimmix.berlios.de/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.10
	>=gnome-base/libglade-2.6
	x11-libs/libnotify
	!media-sound/gimmix
	|| ( media-libs/libmpd-live >=media-libs/libmpd-0.12.0 )
	dev-libs/confuse"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}
