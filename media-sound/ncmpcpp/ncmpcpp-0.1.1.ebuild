# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A ncurses mpd client, clone of ncmpc with some new useful features written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
SRC_URI="http://unkart.ovh.org/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
IUSE="taglib unicode"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

RDEPEND="sys-libs/ncurses
	=media-libs/libmpd-9999
	taglib? ( media-libs/taglib )"
DEPEND="${RDEPEND}"

pkg_setup() {
	if ! built_with_use sys-libs/ncurses unicode && use unicode ; then
		eerror "recompile sys-libs/ncurses with USE unicode"
		die
	fi
}

src_compile() {
	local myconf=""
	if use unicode ; then
		myconf="--with-taglib"
	fi

	econf $(use_enable unicode) \
		${myconf} || die "configure failed"
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
