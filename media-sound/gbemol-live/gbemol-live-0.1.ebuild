# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit autotools subversion

DESCRIPTION="gbemol, a different gtk+/C MPD client"
HOMEPAGE="http://gbemol.sourceforge.net/"
ESVN_REPO_URI="https://${PN/-live}.svn.sourceforge.net/svnroot/${PN/-live}/trunk"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="id3lib"

DEPEND="id3lib? ( media-libs/id3lib )
	>=x11-libs/gtk+-2.10
	>=dev-libs/glib-2.10
	!media-sound/gbemol"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	econf --enable-shared \
		--disable-glibtest \
		--disable-gtktest \
		$(use id3lib && echo '--enable-id3-pic' || echo '--disable-id3-pic')|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
