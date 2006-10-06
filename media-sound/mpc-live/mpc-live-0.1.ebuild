# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="https://svn.musicpd.org/mpc/trunk/"
inherit subversion eautogen-sh

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://musicpd.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"
PROVIDE="media-sound/mpc"

DEPEND=">=sys-devel/autoconf-2.52
	>=automake-1.6
	dev-util/gperf
	dev-libs/openssl
        dev-util/subversion
	!media-sound/mpc
	sys-devel/libtool"

src_install() {
        dobin src/mpc
        dodoc AUTHORS INSTALL README doc/m3u-handler.sh doc/pls-handler.sh doc/mppledit
}
