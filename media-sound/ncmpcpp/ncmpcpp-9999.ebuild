# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools git

DESCRIPTION="A ncurses mpd client, clone of ncmpc with some new useful features written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"
LICENSE="GPL-2"
IUSE="taglib unicode"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

RDEPEND="sys-libs/ncurses
	=media-libs/libmpd-9999
	taglib? ( media-libs/taglib )"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.9"

pkg_setup() {
	if ! built_with_use sys-libs/ncurses unicode && use unicode ; then
		eerror "recompile sys-libs/ncurses with USE unicode"
		die
	fi
}

src_unpack() {
	git_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	localconf=""
	if use taglib; then
		localconf="--with-taglib"
	fi
	
	econf $(use_enable unicode) \
		${localconf} || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make install DESTDIR=${D} \
		|| die "install failed"

	insinto usr/share/ncmpcpp
	doins examples/ncmpcpprc
}

pkg_postinst() {
	elog " Example configuration file has been installed at ${ROOT}usr/share/ncmpcpp/ncmpcpprc"
        elog
        elog " Copy it to your home folder as .ncmpcpprc and set up your preferences."
}
