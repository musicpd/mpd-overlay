# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

DESCRIPTION="Gimmix is a graphical music player daemon (MPD) client written in C using GTK+2."
HOMEPAGE="http://priyank.one09.net/index.php?page=gimmix"
SRC_URI="http://gimmix.berlios.de/releases/${P}.tar.bz2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""
LICENSE="GPL-2"

DEPEND=">=x11-libs/gtk+-2.10
	>=gnome-base/libglade-2.6
	x11-libs/libnotify
	|| (media-libs/libmpd-live >=media-libs/libmpd-0.12.0)
	dev-libs/confuse"

## This fixes a bad bad bug.
replace-flags "-O*" "-O1"

src_install() {
	make DESTDIR=${D} install || die "make install failed"
}