inherit eutils
gmpc-plugin_pkg_setup()
{
        if [[ -n "${GTK_REQUIRES}" ]] && ! built_with_use '=x11-libs/gtk+-2*' "${GTK_REQUIRES}"; then
		eerror "You must build =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
		die "Please re-emerge =x11-libs/gtk+-2.x with ${GTK_REQUIRES} USE flag."
	fi
}

if [[ "${PN##*-}" == "live" ]]; then
	inherit subversion
	DEPEND="${DEPEND}
		media-sound/gmpc-live
		!${CATEGORY}/${PN/-live}"
	RDEPEND="${DEPEND}"
	if [[ -z ${ESVN_REPO_URI} ]]; then
		if [[ -z ${GMPC_PLUGIN} ]]; then
			GMPC_PLUGIN="${PN%-live}"
			GMPC_PLUGIN="${GMPC_PLUGIN#gmpc-}"
		fi

		ESVN_REPO_URI="https://svn.musicpd.org/gmpc/plugins/gmpc-${GMPC_PLUGIN}/trunk"
	fi
else
	## Depend against reverse dependency
	DEPEND="${DEPEND}
		>=media-sound/gmpc-0.14.0
		!${CATEGORY}/${PN}-live"
	RDEPEND="${DEPEND}"
	## In the case that it's given an odd name
	if [[ -z "${GMPC_PLUGIN}" ]]; then
		GMPC_PLUGIN="${P}"
	else
		GMPC_PLUGIN="gmpc-${GMPC_PLUGIN}-${PV}"
	fi
	SRC_URI="http://download.sarine.nl/gmpc-0.14.0/plugins/${GMPC_PLUGIN}.tar.gz"
fi

gmpc-plugin_src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

EXPORT_FUNCTIONS src_install pkg_setup
