# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools git

DESCRIPTION="A ncurses mpd client, clone of ncmpc with some new useful features written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"
LICENSE="GPL-2"
IUSE="curl taglib unicode"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

RDEPEND="sys-libs/ncurses
	curl? ( net-misc/curl )
	taglib? ( media-libs/taglib )"
DEPEND="${RDEPEND}"

pkg_setup() {
	if ! built_with_use sys-libs/ncurses unicode && use unicode ; then
		eerror " recompile sys-libs/ncurses with USE unicode"
		die
	fi
}

src_unpack() {
	git_src_unpack
	AT_NOELIBTOOLIZE="yes" eautoreconf
}

src_compile() {
	econf $(use_enable unicode) \
		$(use_with curl) \
		$(use_with taglib) || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make install DESTDIR=${D} \
		|| die "install failed"

	insinto usr/share/ncmpcpp
	doins examples/ncmpcpp_keys
	doins examples/ncmpcpprc
}

pkg_postinst() {
	elog " Example configuration files have been installed at"
	elog " ${ROOT}usr/share/ncmpcpp/ncmpcpprc"
}
