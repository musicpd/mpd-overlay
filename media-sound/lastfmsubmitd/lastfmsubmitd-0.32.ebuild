# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils

DESCRIPTION="a Last.fm 'plugin' client for MPD, implemented in Python."
SRC_URI="http://www.red-bean.com/~decklin/software/lastfmsubmitd/${PN}-${PV}.tar.bz2"
HOMEPAGE="http://www.red-bean.com/~decklin/software/lastfmsubmitd/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
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