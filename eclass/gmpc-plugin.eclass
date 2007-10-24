inherit eutils
gmpc-plugin_pkg_setup()
{
        if [ -n "${GTK_REQUIRES}" ] && ! built_with_use '=x11-libs/gtk+-2*' "${GTK_REQUIRES}"; then
		eerror "You must build =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
		die "Please re-emerge =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
	fi
}

if [[ "${PN##*-}" == "live" ]]; then
	inherit git autotools
	DEPEND="${DEPEND}
		media-sound/gmpc-live
		dev-libs/libxml2
		!${CATEGORY}/${PN/-live}"
	RDEPEND="${DEPEND}"
	if [ -z ${EGIT_REPO_URI} ]; then
		DEPEND="!<${CATEGORY}/${PN}-0.2
			${DEPEND}"
		if [ -z ${GMPC_PLUGIN} ]; then
			GMPC_PLUGIN="${PN%-live}"
			GMPC_PLUGIN="${GMPC_PLUGIN#gmpc-}"
		fi
		EGIT_REPO_URI="git://git.sarine.nl/gmpc-${GMPC_PLUGIN}.git"
	fi
	gmpc-plugin_src_unpack() {
		git_src_unpack
		AT_NOELIBTOOLIZE="yes" eautoreconf
	}
	EXPORT_FUNCTIONS src_unpack
else
	## Depend against reverse dependency
	DEPEND="${DEPEND}
		>=media-sound/gmpc-${PV}
		!${CATEGORY}/${PN}-live"
	RDEPEND="${DEPEND}"
	
	## In the case that it's given an odd name
	if [ -n "${GMPC_PLUGIN}" ]; then
		GMPC_PLUGIN="gmpc-${GMPC_PLUGIN}-${PV}"
	else
		GMPC_PLUGIN="${P}"
	fi

	[ -z "${SRC_URI}" ] && SRC_URI="http://download.sarine.nl/gmpc-${PV}/plugins/${GMPC_PLUGIN}.tar.gz"
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
	emake DESTDIR="${D}" install || die "Install failed"
}

EXPORT_FUNCTIONS src_install pkg_setup
