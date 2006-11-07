# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/gmpc/trunk/"
inherit subversion eautogen-sh

DESCRIPTION="A Gnome client for the Music Player Daemon."
HOMEPAGE="http://cms.qballcow.nl/"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
SLOT="0"
LICENSE="GPL-2"

DEPEND=">=x11-libs/gtk+-2.4
	>=gnome-base/libglade-2.3
	dev-perl/XML-Parser
	media-libs/libmpd-live
	>dev-util/gob-2
	net-misc/curl"

PROVIDE="media-sound/gmpc"

## This is needed to extract the svn revision for the about window. The
## subversion.eclass doen't copy the .svn directories, so after the copy
## to the working directory, this information is unavilable.
pkg_setup() {
	local repo_uri=${ESVN_REPO_URI%/}
	local repo="${ESVN_STORE_DIR}/${ESVN_PROJECT}/${repo_uri##*/}/src"
	REV=`svn info ${repo} | grep "Last Changed Rev" | awk -F ': ' '{ print $2}'`
}

src_compile() {
       	sed -ie "s%REVISION=.*%REVISION=$REV%" ${WORKDIR}/${PF}/src/Makefile.am

	eautogen-sh || die "autogen.sh failed!"
	emake || die "Make failed!"
}
src_install() {
	make DESTDIR=${D} install || die "make install failed"
}

DOCS="AUTHORS ChangeLog NEWS README"
