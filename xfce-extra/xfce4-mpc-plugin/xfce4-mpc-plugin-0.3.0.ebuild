# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


DESCRIPTION="A simple xfce4 plugin for MPD"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
SRC_URI="http://goodies.xfce.org/releases/${PN}/${P}.tar.gz"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="debug"
RESTRICT="mirror"

DEPEND=">=xfce-base/xfce4-4.4.0
	xfce-extra/xfce4-dev-tools
	!xfce-extra/xfce4-mpc-plugin-live
	|| ( media-libs/libmpd media-libs/libmpd-live )"

src_compile() {
	econf	--disable-dependency-tracking \
		$(use debug && echo '--enable-debug=full' || echo '--disable-debug') || 'configure failed'
	emake
}

src_install() {
	emake install DESTDIR=${D}
}
