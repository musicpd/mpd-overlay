# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.musicpd.org/libmpd/trunk/"
inherit subversion autotools

DESCRIPTION="A library handling connection to a MPD server."
HOMEPAGE="http://sarine.nl/libmpd"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="doc"
DEPEND="virtual/libc
	!media-libs/libmpd
	sys-devel/libtool"
RDEPEND="doc? ( >=app-doc/doxygen-1.4.6 )"

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"

	use doc && cd doc && make doc
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	use doc && dohtml -r doc/html
}
