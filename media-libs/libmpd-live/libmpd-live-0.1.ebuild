# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libmpd/libmpd-0.01.ebuild,v 1.7 2005/11/11 23:23:56 hansmi Exp $

ESVN_REPO_URI="https://svn.musicpd.org/libmpd/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://cms.qballcow.nl/"
LICENSE="GPL-2"

SLOT="0.01"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""
DEPEND="virtual/libc
		sys-devel/libtool"

DEPEND="!>=media-libs/libmpd-0.01"

## Ugly but covers up missing portage feature, we don't want
## libmpd installing over libmpd-live
PROVIDES="media-libs/libmpd"

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc README ChangeLog
}
