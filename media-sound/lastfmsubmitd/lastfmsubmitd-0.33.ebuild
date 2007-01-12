# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="a Last.fm 'plugin' client for MPD, implemented in Python."
SRC_URI="http://www.red-bean.com/~decklin/software/${PN}/${P}.tar.bz2"
HOMEPAGE="http://www.red-bean.com/~decklin/software/lastfmsubmitd/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
RDEPEND="dev-python/py-libmpdclient-live"

src_install() {
        distutils_src_install
        exeinto /etc/init.d
        doexe ${FILESDIR}/init/lastfmsubmitd
        insinto /etc/conf.d/
        insopts -m0600
        doins ${FILESDIR}/conf/lastfmsubmitd
        install -d ${D}/var/log/lastfm
	install -d ${D}/var/run/lastfm
	install -d ${D}/var/spool/lastfm
	install -d ${D}/var/cache/lastfm 
	touch ${D}/var/log/lastfm/lastfm.log
}
