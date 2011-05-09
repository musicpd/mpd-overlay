# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit bash-completion eutils autotools git-2

DESCRIPTION="An ncurses mpd client, ncmpc clone with some new features, written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"

LICENSE="GPL-2"
IUSE="bash-completion clock curl fftw iconv outputs taglib +threads unicode visualizer"

SLOT="0"
KEYWORDS=""

DEPEND="sys-libs/ncurses[unicode?]
	>=media-libs/libmpdclient-9999
	curl? ( net-misc/curl )
	visualizer? ( fftw? ( sci-libs/fftw:3.0 ) )
	iconv? ( virtual/libiconv )
	taglib? ( media-libs/taglib )"
RDEPEND="$DEPEND"
REQUIRED_USE="fftw? ( visualizer )"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable clock) \
		$(use_enable outputs) \
		$(use_enable unicode) \
		$(use_enable visualizer) \
		$(use_with curl) \
		$(use_with iconv) \
		$(use_with threads) \
		$(use_with taglib) \
		$(use_with fftw)
}

src_install() {
	emake install DESTDIR="${D}"

	# use dodoc instead of upstream's doc install which does not compress
	rm -rf "${D}"/usr/share/doc/${PN}
	dodoc AUTHORS NEWS doc/config doc/keys || die "dodoc failed"

	dobashcompletion doc/${PN}-completion.bash ${PN}
}

pkg_postinst() {
	echo
	elog "Example configuration files have been installed at"
	elog "${ROOT}usr/share/doc/${PF}"
	elog "${P} uses ~/.ncmpcpp/config and ~/.ncmpcpp/keys"
	elog "as user configuration files."
	echo
	if use visualizer; then
	elog "If you want to use the visualizer, you need mpd with fifo enabled."
	echo
	fi
	bash-completion_pkg_postinst
}
