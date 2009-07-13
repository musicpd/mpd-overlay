# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit subversion xfce4
xfce4_panel_plugin

DESCRIPTION="Simple MPD Client"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
ESVN_REPO_URI="http://svn.xfce.org/svn/goodies/xfce4-mpc-plugin/trunk"

IUSE=""

DOCS="AUTHORS ChangeLog NEWS README TODO"

REPEND=">=xfce-base/xfce4-panel-4.3.99.1"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/xfce4-dev-tools
	=media-libs/libmpd-9999"
