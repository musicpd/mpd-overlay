# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
GCONF_DEBUG=no
inherit git gnome2 autotools

EGIT_REPO_URI="git://git.gnome.org/vala"
DESCRIPTION="Vala - Compiler for the GObject type system"
HOMEPAGE="http://live.gnome.org/Vala"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="test +vapigen +coverage"

RDEPEND=">=dev-libs/glib-2.12"
DEPEND="${RDEPEND}
	sys-devel/flex
	|| ( sys-devel/bison dev-util/byacc dev-util/yacc )
	dev-util/pkgconfig
	dev-libs/libxslt
	test? ( dev-libs/dbus-glib )"

src_unpack() {
	git_src_unpack
	cd "${S}"
	touch ChangeLog
	mkdir -p m4
	eautoreconf
}

pkg_setup() {
	G2CONF="${G2CONF}
		$(use_enable vapigen)
		$(use_enable coverage)"
	DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"
}
