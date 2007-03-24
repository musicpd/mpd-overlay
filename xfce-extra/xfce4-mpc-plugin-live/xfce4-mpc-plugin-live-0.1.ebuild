# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

ESVN_REPO_URI="http://svn.xfce.org/svn/goodies/xfce4-mpc-plugin/trunk/"
inherit subversion eautogen-sh

DESCRIPTION="A simple xfce4 plugin for MPD"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="debug"

DEPEND=">=xfce-base/xfce4-4.4.0
	xfce-extra/xfce4-dev-tools
	!xfce-extra/xfce4-mpc-plugin
	|| ( media-libs/libmpd media-libs/libmpd-live )"

src_compile() {
	eautogen-sh   --disable-dependency-tracking \
		$(use debug && echo '--enable-debug=full' || echo '--disable-debug') || 'econf failed'
	emake || 'emake failed'
}

src_install() {
	emake install DESTDIR=${D}
}
