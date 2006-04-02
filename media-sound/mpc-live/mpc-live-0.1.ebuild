# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="https://svn.musicpd.org/mpc/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_BOOTSTRAP="autogen.sh"
inherit subversion

S="${WORKDIR}/${P}"

DESCRIPTION="A commandline client for Music Player Daemon (media-sound/mpd)"
HOMEPAGE="http://musicpd.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 fbsd ppc sparc alpha hppa mips"

DEPEND=">=sys-devel/autoconf-2.52
	>=automake-1.6
	dev-util/gperf
	dev-libs/openssl
        dev-util/subversion
	sys-devel/libtool"

RDEPEND="!media-sound/mpc"

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

src_install() {
	dobin src/mpc
	dodoc AUTHORS INSTALL README COPYING
}

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
