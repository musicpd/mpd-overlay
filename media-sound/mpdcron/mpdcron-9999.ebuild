# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit autotools git 

DESCRIPTION="mpdcron is a ‘cron’ like program for mpd.  It can execute scripts
based on mpd’s idle events."
HOMEPAGE="http://repo.or.cz/w/mpdcron.git"
EGIT_REPO_URI="git://repo.or.cz/mpdcron.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

RDEPEND="=media-libs/libmpdclient-9999"
DEPEND="${RDEPEND}"

src_prepare() {
	einfo "Running intltoolize --automake"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README mpdcron.example  
}
