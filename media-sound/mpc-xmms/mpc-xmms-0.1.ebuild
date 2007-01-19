# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils python

DESCRIPTION="A client program for the Music Player Daemon (MPD) that listens for commands through the XMMS-compatible socket."
HOMEPAGE="http://users.tkk.fi/~ptvirtan/programs/utils.html"
SRC_URI="http://users.tkk.fi/~ptvirtan/programs/${P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"

SLOT="0"
IUSE=""
RESTRICT="mirror"

## Yeah, I know it's not in portage anymore, if the user has it in an overlay this ebuild is for them.
DEPEND="media-sound/xmms"
RDEPEND="${DEPEND}"

src_compile() {
	## When is this trash going to be in portage or an ebuild somewhere?
	## This was C&P'd from app-i18n/skim
	local sconsopts=$(echo "${MAKEOPTS}" | sed -e "s/.*\(-j[0-9]\+\).*/\1/")
	[[ ${MAKEOPTS/-s/} != ${MAKEOPTS} ]] && sconsopts="${sconsopts} -s"

	CFLAGS="${CXXFLAGS}" scons ${sconsopts} || die "Failed to compile"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
