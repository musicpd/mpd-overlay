# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="https://svn.musicpd.org/gmpc/trunk/"
inherit subversion autotools

DESCRIPTION="A Gnome client for the Music Player Daemon."
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="mmkeys session trayicon"

RDEPEND=">=x11-libs/gtk+-2.8
	>=dev-libs/glib-2.10
	>=gnome-base/libglade-2.3
	session? ( x11-libs/libSM )
	dev-perl/XML-Parser
	media-libs/libmpd-live
	>dev-util/gob-2
	!media-sound/gmpc
	net-misc/curl"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

## This is needed to extract the svn revision for the about window. The
## subversion.eclass doen't copy the .svn directories, so after the copy
## to the working directory, this information is unavilable.
pkg_setup() {
	local repo_uri=${ESVN_REPO_URI%/}
	local repo="${ESVN_STORE_DIR}/${ESVN_PROJECT}/${repo_uri##*/}/src"
	REV=`svn info ${repo} | grep "Last Changed Rev" | awk -F ': ' '{ print $2}'`
}

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
       	sed -ie "s%REVISION=.*%REVISION=$REV%" ${WORKDIR}/${PF}/src/Makefile.am

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
