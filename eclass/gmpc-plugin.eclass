if [[ "${PN##*-}" == "live" ]]; then
	inherit subversion
	DEPEND="${DEPEND}
		media-sound/gmpc-live
		!${CATEGORY}/${PN/-live}"
	if [[ -z ${ESVN_REPO_URI} ]]; then
		if [[ -z ${GMPC_SVN_ROOT} ]]; then
			GMPC_SVN_ROOT="${PN%-live}"
			GMPC_SVN_ROOT="${GMPC_SVN_ROOT#gmpc-}"
		fi

		ESVN_REPO_URI="https://svn.musicpd.org/gmpc/plugins/gmpc-${GMPC_SVN_ROOT}/trunk"
	fi
else
	## Depend against reverse dependency
	DEPEND="${DEPEND}
		>=media-sound/gmpc-0.14.0
		!${CATEGORY}/${PN}-live"]

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

EXPORT_FUNCTIONS src_install
