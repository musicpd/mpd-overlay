DEPEND="media-sound/gmpc-live"

if expr match "${PN}" '.*\(-live\)'>/dev/null; then
	if [[ -z ${ESVN_REPO_URI} ]]; then
		if [[ -z ${GMPC_SVN_ROOT} ]]; then
			GMPC_SVN_ROOT="${PN%-live}"
		fi
		ESVN_REPO_URI="https://svn.qballcow.nl/${GMPC_SVN_ROOT}/trunk/"
	fi

	inherit subversion
fi

gmpc-plugin_src_compile() {
## We don't need the protection of 'econf' in here, we do the installing by hand.
    if [ -x ./autogen.sh ]; then
        ./autogen.sh
    elif [ -x ./configure ]; then
        ./configure
    else
        die "Couldn't find a configure for this plugin!"
    fi

    if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
        emake || die "emake failed"
    fi
}

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

EXPORT_FUNCTIONS src_compile src_install
