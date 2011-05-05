# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit distutils subversion

DESCRIPTION="an elegant GTK+ music client for the Music Player Daemon (MPD)."
HOMEPAGE="http://codingteam.net/project/sonata/"
ESVN_REPO_URI="http://svn.codingteam.net/sonata/"

LICENSE="GPL-3"
KEYWORDS=""
SLOT="0"
IUSE="dbus lyrics taglib +trayicon"

PYTHON_DEPEND="2"

RDEPEND=">=dev-python/pygtk-2.12
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
