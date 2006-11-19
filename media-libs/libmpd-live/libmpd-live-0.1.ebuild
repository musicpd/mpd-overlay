# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/libmpd/trunk/"
inherit subversion eautogen-sh

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://cms.qballcow.nl/"
LICENSE="GPL-2"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""
DEPEND="virtual/libc
	!media-libs/libmpd
	sys-devel/libtool"


src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc README ChangeLog
}
