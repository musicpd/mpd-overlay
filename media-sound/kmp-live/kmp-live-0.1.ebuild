# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils kde-functions subversion

need-qt 3

ESVN_REPO_URI="https://svn.musicpd.org/kmp/trunk/"
ESVN_BOOTSTRAP="autogen.sh"

DESCRIPTION="An MPD client that uses Qt"
HOMEPAGE="http://www.threadbox.net/kmp.php"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND="!media-sound/kmp"

src_compile() {
	echo QMAKE_CFLAGS_RELEASE=${CFLAGS} >> kmp.pro
	echo QMAKE_CXXFLAGS_RELEASE=${CXXFLAGS} >> kmp.pro

	ac_moc=${QTDIR}/bin/moc ac_uic=${QTDIR}/bin/uic ac_qmake=${QTDIR}/bin/qmake econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	dobin kmp
	dodoc README

	insinto /usr/share/pixmaps
	newins pics/icon.png kmp.png
	make_desktop_entry kmp "KMP" kmp.png "KDE;Qt;AudioVideo" "" "Multimedia"

	# KDE doesn't like two of the same .desktop entries
	rm -rf ${D}/usr/share/applnk
}
