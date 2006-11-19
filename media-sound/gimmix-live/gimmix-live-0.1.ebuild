# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="svn://svn.berlios.de/gimmix/trunk/src"
ESVN_PROJECT="src"
inherit subversion flag-o-matic

DESCRIPTION="Gimmix is a graphical music player daemon (MPD) client written in C using GTK+2."
HOMEPAGE="http://priyank.one09.net/index.php?page=gimmix"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
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
