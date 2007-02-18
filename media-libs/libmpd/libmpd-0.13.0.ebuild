# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://sarine.nl/gmpc"
LICENSE="GPL-2"
SRC_URI="http://download.sarine.nl/gmpc-0.14.0/${P}.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
DEPEND="virtual/libc
	!media-libs/libmpd-live
	sys-devel/libtool"


src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc README ChangeLog
}
