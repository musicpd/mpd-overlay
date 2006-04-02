# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="https://svn.musicpd.org/ncmpc/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

S="${WORKDIR}/${P}"
IUSE="clock-screen debug mouse key-screen search-screen nls raw-mode"
DESCRIPTION="A ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="http://www.musicpd.org/?page=ncmpc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 fbsd ppc sparc alpha hppa mips"

RDEPEND="virtual/libc
        sys-libs/ncurses
        dev-libs/popt
        >=dev-libs/glib-2.4
		!media-sound/ncmpc"
DEPEND="${RDEPEND}"

pkg_setup() {
	        use search-screen && einfo "Please note that the search-screen is
			experimental"
}

src_compile() {
	econf $(use_enable clock-screen) \
		$(use_enable debug) \
		$(use_enable mouse) \
		$(use_enable key-screen) \
		$(use_enable search-screen) \
		$(use_with nls) \
		$(use_with raw-mode)

		emake || die "make failed"
}																																	

src_install() {
	dobin src/ncmpc
	dodoc AUTHORS \
		ChangeLog \
		NEWS \
		README \
		TODO \
		doc/config.sample \
		doc/keys.sample \
		doc/ncmpc.lirc
	doman doc/ncmpc.1
}

#S=${WORKDIR}/${ECVS_MODULE}mpc-svn-0.1/

#src_compile() {
	# Fixes bug 27584
#	export WANT_AUTOCONF=2.5

#	cd ${S}
#	./configure \
#		--host=${CHOST} \
#		--prefix=/usr \
#		--infodir=/usr/share/info \
#		--mandir=/usr/share/man \
#		--sysconfdir=/etc \
#		${myconf} || die "./configure failed"
#	emake || die
#}

#src_install() {
#	dobin src/mpc
#	dodoc AUTHORS INSTALL README COPYING
#}

#src_install() {
#	myflags=""

#	make DESTDIR=${D} \
#		docdir=/usr/share/doc/${PF} \
#		install || die

#	prepalldocs
#	dodoc AUTHORS INSTALL README COPYING
#	cd ${S}doc
#	doman mpc.1
#	dohtml -r . || die "dohtml failed"
#}
