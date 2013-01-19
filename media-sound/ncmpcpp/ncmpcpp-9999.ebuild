# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools bash-completion-r1 eutils git-2

DESCRIPTION="An ncurses mpd client, ncmpc clone with some new features, written in C++"
HOMEPAGE="http://unkart.ovh.org/ncmpcpp"
EGIT_REPO_URI="git://repo.or.cz/ncmpcpp.git"
EGIT_BOOTSTRAP="eautoreconf"

LICENSE="GPL-2"
IUSE="bash-completion clock curl fftw outputs taglib unicode visualizer"
SLOT="0"
KEYWORDS=""

RDEPEND="
	sys-libs/ncurses[unicode?]
	~media-libs/libmpdclient-9999
	curl? ( net-misc/curl )
	visualizer? ( fftw? ( sci-libs/fftw:3.0 ) )
	taglib? ( media-libs/taglib )
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	# work around a compilation issue when USE=-curl
	sed -i src/lyrics.cpp -e 's|itsFolder|Config.ncmpcpp_directory + "artists"|g' || die
}

src_configure() {
	local myconf=""
	if use fftw; then
		myconf="$(use_with visualizer fftw)"
		if ! use visualizer; then
			ewarn "For the fftw USE flag to have any effect, you must also"
			ewarn "enable the visualizer USE flag."
		fi
	else
		myconf="--without-fftw"
	fi
	econf \
		${myconf} \
		$(use_enable clock) \
		$(use_enable outputs) \
		$(use_enable unicode) \
		$(use_enable visualizer) \
		$(use_with curl) \
		$(use_with taglib)
}

src_install() {
	default

	# use dodoc instead of upstream's doc install which does not compress
	rm -rf "${D}"/usr/share/doc/${PN}
	dodoc AUTHORS NEWS doc/config doc/bindings

	if use bash-completion; then
		newbashcomp doc/${PN}-completion.bash ${PN}
	fi
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
}
