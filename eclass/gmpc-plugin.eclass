DEPEND="media-sound/gmpc-live"

if [[ "${PN##*-}" == "live" ]]; then
	inherit subversion
	if [[ -z ${ESVN_REPO_URI} ]]; then
		if [[ -z ${GMPC_SVN_ROOT} ]]; then
			GMPC_SVN_ROOT="${PN%-live}"
			GMPC_SVN_ROOT="${GMPC_SVN_ROOT#gmpc-}"
		fi

		ESVN_REPO_URI="https://svn.musicpd.org/gmpc/plugins/gmpc-${GMPC_SVN_ROOT}/trunk"
	fi
fi

gmpc-plugin_src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

EXPORT_FUNCTIONS src_install
