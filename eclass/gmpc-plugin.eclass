inherit eutils
gmpc-plugin_pkg_setup()
{
        if [ -n "${GTK_REQUIRES}" ] && ! built_with_use '=x11-libs/gtk+-2*' "${GTK_REQUIRES}"; then
		eerror "You must build =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
		die "Please re-emerge =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
	fi
}

if [ "${PV}" == "9999" ]; then
	inherit git autotools
	DEPEND="${DEPEND}
		=media-sound/gmpc-9999
		dev-libs/libxml2"
	RDEPEND="${DEPEND}"
	if [ -z ${EGIT_REPO_URI} ]; then
		DEPEND="${DEPEND}"
		if [ -z ${GMPC_PLUGIN} ]; then
			GMPC_PLUGIN="${PN}"
			GMPC_PLUGIN="${GMPC_PLUGIN#gmpc-}"
		fi
		EGIT_REPO_URI="git://repo.or.cz/gmpc-${GMPC_PLUGIN}.git"
	fi
	gmpc-plugin_src_unpack() {
		git_src_unpack
		AT_NOELIBTOOLIZE="yes" eautoreconf
	}
	EXPORT_FUNCTIONS src_unpack
else
	RESTRICT="primaryuri"
	## Depend against reverse dependency
	DEPEND="${DEPEND}
		>=media-sound/gmpc-${PV}"
	RDEPEND="${DEPEND}"
	
	## In the case that it's given an odd name
	if [ -n "${GMPC_PLUGIN}" ]; then
		GMPC_PLUGIN="gmpc-${GMPC_PLUGIN}-${PV}"
	else
		GMPC_PLUGIN="${P}"
	fi

	[ -z "${SRC_URI}" ] && SRC_URI="http://download.sarine.nl/gmpc-0.15.5-rc4/${GMPC_PLUGIN}.tar.gz"
	[ -z "${S}" ] && S="${WORKDIR}/${GMPC_PLUGIN}"

	## Without this, portage keeps appending to $GMPC_PLUGIN
	unset GMPC_PLUGIN

	gmpc-plugin_src_compile() {
		cd "${S}"
		econf || die "died configuring gmpc plugin"
		emake || die "died making gmpc plugin"
	}

	EXPORT_FUNCTIONS src_compile
fi

gmpc-plugin_src_install() {
	cd "${S}"
	emake DESTDIR="${D}" install || die "Install failed"
}

## A few sane defaults
HOMEPAGE="http://gmpcwiki.sarine.nl/index.php/${PN/gmpc-}"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

EXPORT_FUNCTIONS src_install pkg_setup
