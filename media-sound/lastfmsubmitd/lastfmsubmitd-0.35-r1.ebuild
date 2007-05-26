# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils eutils

DESCRIPTION="a Last.fm 'plugin' client for MPD, implemented in Python."
SRC_URI="http://www.red-bean.com/~decklin/software/lastfmsubmitd/${P}.tar.bz2"
HOMEPAGE="http://www.red-bean.com/~decklin/software/lastfmsubmitd/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc ppc64 sparc x86"
IUSE=""
RDEPEND="|| ( dev-python/py-libmpdclient-live dev-python/py-libmpdclient )"

src_install() {
	distutils_src_install
	dodoc INSTALL

	# Now install rc-scripts
	doinitd ${FILESDIR}/lastfmsubmitd
	doinitd ${FILESDIR}/lastmp

	# Directories at /var (spool, logs...)
	for x in log run spool ; do
		install -d ${D}/var/$x/lastfm
		fowners lastfm /var/$x/lastfm
		fperms 775 /var/$x/lastfm
		keepdir /var/$x/lastfm
	done
	touch ${D}/var/log/lastfm/lastfm.log
	fowners lastfm /var/log/lastfm/lastfm.log

	# Change ownership and make these setuid
	for x in lastcd lastmp ; do
		fowners lastfm /usr/bin/$x
		fperms u+s /usr/bin/$x
	done

	# Configuration files.
	insinto /etc
	doins ${FILESDIR}/lastfmsubmitd.conf
	doins ${FILESDIR}/lastmp.conf
}


pkg_postinst () {
	einfo
	einfo "You must edit '/etc/lastfmsubmitd.conf' before use. You may want to"
	einfo "check defaults from '/etc/lastmp.conf' if your MPD setup is not the"
	einfo "default shipped with Gentoo."
	einfo
}


pkg_setup () {
	enewuser lastfm -1 "/bin/sh"
}

