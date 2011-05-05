# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gmpc-plugin

DESCRIPTION="This plugin allows you to tag your music collection."
KEYWORDS=""
DEPEND="media-libs/taglib"
RDEPEND="${DEPEND}"
IUSE=""

pkg_postinst() {
	elog "This plugin is extremely alpha. Use with caution (and realize there won't be errors, yet)"
}
