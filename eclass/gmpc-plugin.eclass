DEPEND="media-sound/gmpc-live"

if [[ "${PN##*-}" == "live" ]]; then
	if [[ -z ${ESVN_REPO_URI} ]]; then
		if [[ -z ${GMPC_SVN_ROOT} ]]; then
			GMPC_SVN_ROOT="${PN%-live}"
		fi
		ESVN_REPO_URI="https://svn.qballcow.nl/${GMPC_SVN_ROOT}/trunk/"
	fi

	inherit subversion
fi

gmpc-plugin_src_install() {
	if [[ -z ${GMPC_PLUGIN} ]]; then
		GMPC_PLUGIN="${PN#gmpc}"
		GMPC_PLUGIN="${GMPC_PLUGIN%live}"
		GMPC_PLUGIN="${GMPC_PLUGIN//-}"
	fi

        # This makefile ignores DEST, so manual installation
        insinto "/usr/share/gmpc/plugins"
	if [[ -f "src/.libs/${GMPC_PLUGIN}plugin.so" ]]; then
	        doins "src/.libs/${GMPC_PLUGIN}plugin.so"
	elif [[ -f "src/.libs/lib${GMPC_PLUGIN}.so" ]]; then
		doins "src/.libs/lib${GMPC_PLUGIN}.so"
	else
		doins "src/.libs/${GMPC_PLUGIN}.so"
	fi
	if [[ ! -z ${GMPC_DOCS} ]]; then
		dodoc ${GMPC_DOCS}
	fi
}

EXPORT_FUNCTIONS src_install
