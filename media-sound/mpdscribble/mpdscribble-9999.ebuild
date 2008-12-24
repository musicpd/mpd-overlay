# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
EGIT_REPO_URI="git://git.musicpd.org/master/mpdscribble.git"
inherit git autotools

DESCRIPTION="An MPD client that submits information to audioscrobbler."
HOMEPAGE="http://mpd.wikia.com/wiki/Client:Mpdscribble"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

DEPEND="net-libs/libsoup:2.2"

src_prepare() {
	eautoreconf
}

src_install() {
	make DESTDIR=${D} install || die

	exeinto /usr/share/mpdscribble
	doexe setup.sh

	doman mpdscribble.1
	newinitd ${FILESDIR}/mpdscribble.rc mpdscribble

	dodoc AUTHORS ChangeLog NEWS README TODO

	dodir /var/cache/mpdscribble
}

pkg_postinst() {
	einfo ""
	einfo "Please run:"
	einfo "  /usr/share/mpdscribble/setup.sh"
	einfo "in order to configure mpdscribble. If you do this as root, a"
	einfo "system-wide configuration will be created. Otherwise, a per-user"
	einfo "configuration file will be created."
	einfo ""
	einfo "To start mpdscribble:"
	einfo "  /etc/init.d/mpdscribble start"
	einfo ""
}
