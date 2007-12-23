# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=1
inherit gnome2 subversion autotools flag-o-matic

## Because gnome2 is dumb
unset SRC_URI

DESCRIPTION="A MPD client with an Rhythmbox inspired interface."
HOMEPAGE="http://ario-player.sourceforge.net/"
ESVN_REPO_URI="https://ario-player.svn.sourceforge.net/svnroot/ario-player/trunk"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="debug +inet-stream +search +playlist"

DEPEND="gnome-base/libgnomeui
	gnome-base/libglade
	gnome-base/eel
	net-misc/curl
	media-libs/libmpd"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-player"

src_unpack() {
	subversion_src_unpack
	eautoreconf
}

src_compile() {
	## For some reason compilation fails when without optimization
	replace-flags -O0 -O1
	econf	$(use_enable debug) \
		$(use_enable inet-stream) \
		$(use_enable playlist) \
		$(use_enable search) || die "econf failed"
	emake || die "emake failed"
}
