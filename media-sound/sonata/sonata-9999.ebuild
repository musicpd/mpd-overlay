# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=2
# $Header: $

inherit distutils subversion

DESCRIPTION="an elegant GTK+ music client for the Music Player Daemon (MPD)."
HOMEPAGE="http://sonata.berlios.de/"
ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/sonata/trunk"

LICENSE="GPL-3"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="dbus lyrics taglib +trayicon"

RDEPEND=">=virtual/python-2.5
	>=dev-python/pygtk-2.12
	>=x11-libs/gtk+-2:2[jpeg]
	>=dev-python/python-mpd-0.2.1
	dbus? ( dev-python/dbus-python )
	lyrics? ( dev-python/zsi )
	taglib? ( >=dev-python/tagpy-0.93 )
	trayicon? ( dev-python/egg-python )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="CHANGELOG README TODO TRANSLATORS"

src_install() {
	distutils_src_install
	rm -rf "${D}"/usr/share/sonata
}
