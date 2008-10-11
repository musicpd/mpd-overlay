# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit autotools git

DESCRIPTION="A GTK+2 client for the Music Player Daemon."
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/GMPC"
EGIT_REPO_URI="git://repo.or.cz/gmpc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="+mmkeys +session +trayicon"

RDEPEND=">=dev-libs/glib-2.10:2
	dev-perl/XML-Parser
	dev-util/gob
	>=gnome-base/libglade-2.3
	>=media-libs/libmpd-0.16.0
	net-misc/curl
	>=x11-libs/gtk+-2.12:2
	session? ( x11-libs/libSM )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	einfo "Running intltoolize --automake"
	intltoolize --automake || die "intltoolize failed"

	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_configure() {
	sed -ie \
		"s%REVISION=.*%REVISION=`git --git-dir="${EGIT_STORE_DIR}/${EGIT_PROJECT}" rev-parse ${EGIT_BRANCH}`%" \
		${WORKDIR}/${PF}/src/Makefile.am

	econf $(use_enable mmkeys) \
		$(use_enable session sm) \
		$(use_enable trayicon) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README TODO
}
