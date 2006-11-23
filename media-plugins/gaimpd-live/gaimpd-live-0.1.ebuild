
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="https://svn.ayeon.org/gaimpd/trunk/"
ESVN_BOOTSTRAP="autoconf"
inherit subversion

DESCRIPTION="A gaim plugin for MPD"
HOMEPAGE="http://sarine.nl"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
LICENSE="GPL-2"

DEPEND="=net-im/gaim-2*
	|| ( media-libs/libmpd-live media-libs/libmpd )"

src_install() {
	emake install DESTDIR=${D} || die

	einfo "If you're installing this with gaim-1.x this"
	einfo "plugin may not work as expected, please contact"
	einfo "the author if something unexpected occurs"
}
