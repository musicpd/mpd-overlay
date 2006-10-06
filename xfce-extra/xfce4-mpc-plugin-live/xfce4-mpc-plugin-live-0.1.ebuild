# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header:

ESVN_REPO_URI="http://svn.xfce.org/svn/goodies/xfce4-mpc-plugin/trunk/"
inherit subversion eautogen-sh

IUSE=""
DESCRIPTION="A simple xfce4 plugin for MPD"
HOMEPAGE="http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~fbsd ~ppc ~sparc ~alpha ~hppa ~mips"

## I'm not sure this is the dependency this ebuild needs, if anyone knows
## please shoot me an email at avuton@gmail.com
DEPEND="=xfce-base/xfce4-4.3.90.2
	xfce-base/xfce4-dev-tools
	!xfce-extra/xfce4-mpc-plugin
	(|| (media-libs/libmpd media-libs/libmpd-live))"

src_install() {
	emake install DESTDIR=${D}
}
