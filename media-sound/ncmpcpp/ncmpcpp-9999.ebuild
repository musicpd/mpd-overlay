# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit eutils autotools git

DESCRIPTION="An ncurses mpd client, ncmpc clone with some new features, written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"
LICENSE="GPL-2"
IUSE="clock curl iconv outputs taglib +threads unicode visualizer"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

DEPEND="sys-libs/ncurses[unicode?]
	curl? ( net-misc/curl )
	iconv? ( virtual/libiconv )
	taglib? ( media-libs/taglib )
	visualizer? ( sci-libs/fftw:3.0 )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf	$(use_enable outputs) \
		$(use_enable visualizer) \
		$(use_enable clock) \
		$(use_enable unicode) \
		$(use_with curl) \
		$(use_with iconv) \
		$(use_with threads) \
		$(use_with taglib)
}

src_install() {
	make install DESTDIR="${D}" docdir="${ROOT}/usr/share/doc/${PF}" \
		|| die "install failed"
}

pkg_postinst() {
	echo
	elog "Example configuration files have been installed at"
	elog "${ROOT}usr/share/doc/${PF}"
	elog "${P} uses ~/.ncmpcpp/config and ~/.ncmpcpp/keys"
	elog "as user configuration files."
	echo
}
