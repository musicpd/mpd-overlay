# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="http://svn.syscrash.ca/tinystuff/mpd_inotify"
inherit subversion

IUSE=""

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://syscrash.ca"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="||(media-sound/mpd media-sound/mpd-live media-sound/mpd-ke)"
RDEPEND=""

src_compile() {
	      ./build.sh
}

src_install() {
	      dobin mpd_inotify
}

pkg_postinst() {
	einfo "Unlike most MPD clients this has to reside on the same"
	einfo "physical computer as the MPD client and have access to"
	einfo "the same physical files as the MPD server."
}
