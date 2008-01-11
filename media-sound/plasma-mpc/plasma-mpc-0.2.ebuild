# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit cmake-utils

DESCRIPTION="A simple MPD control plasmoid."
HOMEPAGE="http://www.kde-apps.org/content/show.php/plasma-mpc?content=73309"
SRC_URI="http://www.kde-apps.org/CONTENT/content-files/73309-plasma-mpc_0.2.tar.gz"
LICENSE="GPL"

SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="primaryuri"

DEPEND="|| ( kde-base/plasma >=kde-base/kdebase-3.97.0 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}_${PV}"