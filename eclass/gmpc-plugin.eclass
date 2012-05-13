[ -z "${SRC_URI}" ] && inherit git-2
inherit autotools

DEPEND="${DEPEND}
	=media-sound/gmpc-9999
	dev-libs/libxml2"
RDEPEND="${DEPEND}"

if [ -z ${EGIT_REPO_URI} ] || [ -z "${SRC_URI}" ]; then
	DEPEND="${DEPEND}"
	if [ -z ${GMPC_PLUGIN} ]; then
		GMPC_PLUGIN="${PN}"
		GMPC_PLUGIN="${gmpc-${GMPC_PLUGIN}}"
	fi
	EGIT_REPO_URI="git://git.musicpd.org/qball/${GMPC_PLUGIN}.git"
fi

if [ -z "${SRC_URI}" ]; then
	gmpc-plugin_src_prepare() {
		eautoreconf
	}
fi

gmpc-plugin_src_install() {
	cd "${S}"
	emake DESTDIR="${D}" install || die "Install failed"
}

#TODO Use ${var^^} when gentoo makes the switch to bash4
local my_plugin="`echo ${PN/gmpc-} | tr '[a-z]' '[A-Z]'`"

## A few sane defaults
HOMEPAGE="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_${my_plugin}"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

EXPORT_FUNCTIONS src_install src_prepare
