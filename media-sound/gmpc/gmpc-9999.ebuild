# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=1
inherit autotools git

DESCRIPTION="A Gnome client for the Music Player Daemon."
HOMEPAGE="http://sarine.nl/gmpc"
EGIT_REPO_URI="git://repo.or.cz/gmpc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="gnome +mmkeys +session +trayicon"

RDEPEND=">=dev-libs/glib-2.10
	dev-perl/XML-Parser
	>=gnome-base/libglade-2.3
	>=media-libs/libmpd-0.15.0
	net-misc/curl
	>=x11-libs/gtk+-2.8
	x11-themes/hicolor-icon-theme
	gnome? ( >=gnome-base/gnome-vfs-2.6 )
	session? ( x11-libs/libSM )
	>=dev-util/gob-2
	dev-util/intltool" ## Required for live repo only
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	git_src_unpack

	einfo "Running intltoolize --automake"
	intltoolize --automake || die "intltoolize failed"

	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	sed -ie \
		"s%REVISION=.*%REVISION=`git --git-dir="${EGIT_STORE_DIR}/${EGIT_PROJECT}" rev-parse ${EGIT_BRANCH}`%" \
		${WORKDIR}/${PF}/src/Makefile.am

	econf $(use_enable mmkeys) \
		$(use_enable session sm) \
		$(use_enable trayicon) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README
}
