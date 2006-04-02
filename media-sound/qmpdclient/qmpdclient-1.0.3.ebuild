# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="MPD client written in Qt 4.x"
HOMEPAGE="http://havtknut.tihlde.org/software/qmpdclient"
SRC_URI="http://havtknut.tihlde.org/software/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

RESTRICT="nomirror"

DEPEND=">=x11-libs/qt-4.1"

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi

	if use debug; then
		sed -ie 's/CONFIG -= debug/CONFIG += debug/' ${S}/src/src.pro || \
				die 'sed failed in debug'
	fi
}

src_install() {
	# Fix the path
        sed -ie "s%/usr/local%${D}/usr%g" ${S}/src/src.pro || die 'sed failed in path'

        make install || die 'Install failed!'

	dodoc README
	insinto /usr/share/pixmaps
	newins images/qmpdclient64.png 	qmpdclient64.png
	
	make_desktop_entry qmpdclient "QMPDclient" qmpdclient64.png "KDE;Qt;AudioVideo"
}
