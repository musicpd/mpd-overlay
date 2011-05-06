# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gkrellm-plugin

DESCRIPTION="A gkrellm plugin to control the MPD (Music Player Daemon)"
HOMEPAGE="http://mpd.wikicities.com/wiki/Client:GKrellMPC"
SRC_URI="http://mina.naguib.ca/dist/${P}.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
LICENSE="GPL-2"

DEPEND="app-admin/gkrellm"
RDEPEND="net-misc/curl"
SLOT="0"
