# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

ESVN_REPO_URI="https://svn.ayeon.org/pidgimpd/trunk/"
inherit subversion autotools

DESCRIPTION="A gaim plugin for MPD"
HOMEPAGE="http://svn.ayeon.org/pidgimpd/"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

IUSE="debug"

DEPEND="net-im/pidgin"

src_unpack() {
	subversion_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	econf $(use_enable debug) || 'Configure failed.'
	emake || 'Make failed.'
}

src_install() {
	emake install DESTDIR=${D} || die
}
