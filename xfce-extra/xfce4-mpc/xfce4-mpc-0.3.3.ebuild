# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-extra/xfce4-weather/xfce4-weather-0.6.4.ebuild,v 1.3 2009/07/09 22:10:57 ssuominen Exp $

inherit autotools xfce4
COMPRESS=".tar.gz"
xfce4_panel_plugin

DESCRIPTION="Simple MPD Client"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

DOCS="AUTHORS ChangeLog NEWS README TODO"

REPEND=">=xfce-base/xfce4-panel-4.3.99.1"
DEPEND="${RDEPEND}
	dev-util/intltool
	media-libs/libmpd"
