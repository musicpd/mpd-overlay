# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit mpd-www eutils

DESCRIPTION="A web client written in php/AJAX"
HOMEPAGE="http://pitchfork.remiss.org"
SRC_URI="http://pitchfork.remiss.org/files/${P}.tar.bz2"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
S="${WORKDIR}/${PN}"

RDEPEND=">=dev-lang/php-5.0.0
	dev-php/PEAR-PEAR
	net-www/apache"

pkg_setup() {
	webapp_pkg_setup
	if ! built_with_use dev-lang/php simplexml; then
		eerror "dev-lang/php is missing simplexml support. Please add"
		eerror "'simplexml' to that package's USE flags, and re-emerge"
		eerror "dev-lang/php"
		die "dev-lang/php needs simplexml support"
	fi

	if ! built_with_use dev-lang/php json; then
		ewarn "dev-lang/php is missing json support. There are compatibility"
		ewarn "functions for the time being; these may disappear in the future"
	fi
}

src_install() {
	mpd-www_src_install
}

pkg_postinst() {
	webapp_pkg_postinst
	einfo "Make sure you run chmod {your http user} ${ROOT}${MY_APPDIR}/config"
	einfo "before running pitchfork, or you will be unable to configure."
}
