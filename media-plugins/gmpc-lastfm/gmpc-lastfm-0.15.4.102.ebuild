# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

GTK_REQUIRES="jpeg"
GMPC_PLUGIN="last.fm"
S="${WORKDIR}/gmpc-${GMPC_PLUGIN}-${PV}"

inherit gmpc-plugin

DESCRIPTION="The last.fm plugin can fetch artist images, from last.fm. This plugin doesn't scrobble your music, use a dedicated client like mpdscribble for this."
HOMEPAGE="http://sarine.nl/gmpc-plugins-lastfm"
LICENSE="GPL-2"
SRC_URI="http://download.sarine.nl/gmpc-0.15.5-rc4/gmpc-last.fm-0.15.4.102.tar.gz"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""