# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2


ESVN_REPO_URI="svn://pitchfork.remiss.org/pitchfork"
inherit mpd-www

DESCRIPTION="A web client written in php/AJAX"
HOMEPAGE="http://pitchfork.remiss.org/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="virtual/php
	net-www/apache"
