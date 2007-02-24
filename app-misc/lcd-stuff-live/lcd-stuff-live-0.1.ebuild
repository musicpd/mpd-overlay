# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/lcd-stuff/lcd-stuff-0.1.2.ebuild,v 1.2 2007/01/16 00:36:36 rbu Exp $

inherit subversion eautogen-sh

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/lcd-stuff/trunk"
DESCRIPTION="lcd-stuff is a client for lcdproc that displays RSS, Weather, MPD and new mail."
HOMEPAGE="http://lcd-stuff.berlios.de/"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
LICENSE="GPL-2" # and GPL-2 only

DEPEND="app-misc/lcdproc
	net-misc/curl
	imap? ( net-libs/libetpan )
	mpd? ( media-libs/libmpd-live )
	mp3? ( media-libs/taglib )
	xml? ( net-libs/libnxml )
	rss? ( net-libs/libmrss net-libs/libnxml )"
RDEPEND=${DEPEND}
DEPEND="${DEPEND}
	dev-util/pkgconfig"

IUSE="imap mpd mp3 xml rss"

src_compile() {
	local XMLRSSLIB="$(use_enable rss mrss)"
	if use rss ; then
		# If we want rss, we must also have xml
		XMLRSSLIB="${XMLRSSLIB} --enable-nxml"
	else
		XMLRSSLIB="${XMLRSSLIB} $(use_enable xml nxml)"
	fi

	eautogen-sh \
		$(use_enable imap libetpan) \
		$(use_enable mpd libmpd) \
		$(use_enable mp3 taglib_c) \
		$XMLRSSLIB \
		|| die "configure failed"

	emake || die "make failed"
}

src_install()
{
	emake DESTDIR=${D} install || die "make install failed"

	insinto /etc
	doins lcd-stuff.conf

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}

	dodoc ChangeLog README
}