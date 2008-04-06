# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils subversion

DESCRIPTION="an elegant GTK+ music client for the Music Player Daemon (MPD)."
HOMEPAGE="http://sonata.berlios.de/"
ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/sonata/trunk"

LICENSE="GPL-3"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"
IUSE="taglib lyrics dbus scrobbler"

RDEPEND=">=virtual/python-2.4
	>=dev-python/pygtk-2.10
	taglib? ( >=dev-python/tagpy-0.93 )
	dbus? ( dev-python/dbus-python )
	lyrics? ( dev-python/zsi )
	scrobbler? ( dev-python/elementtree )"

pkg_setup() {
	if ! built_with_use '=x11-libs/gtk+-2*' jpeg; then
		ewarn "If you want album cover art displayed in Sonata,"
		ewarn "you must build gtk+-2 with the \"jpeg\" USE flag."
	fi
}

DOCS="CHANGELOG README TODO TRANSLATORS"
