# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="http://svn.syscrash.ca/tinystuff/mpd_inotify"
inherit subversion

IUSE=""

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://syscrash.ca"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"

# Need to figure out how to do this correctly, later.
#DEPEND="media-sound/mpd ||
#	media-sound/mpd-svn ||
#	media-sound/mpd-live ||
#	media-sound/mpd-ke"

RDEPEND=""

src_compile() {
	      ./build.sh
}

src_install() {
	      mv -v main mpd_inotify
	      dobin mpd_inotify
}

pkg_postinst() {
	einfo "Unlike most MPD clients this has to reside on the same"
	einfo "physical computer as the MPD client and have access to"
	einfo "the same physical files as the MPD server."
}
