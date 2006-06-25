DEPEND="media-sound/gmpc-live"

if expr match "${PN}" '.*\(-live\)'>/dev/null; then
	inherit subversion
	SVN_ROOT="${PN%-live}"
	ESVN_REPO_URI="https://svn.qballcow.nl/${SVN_ROOT}/trunk/"
	ESVN_BOOTSTRAP="autogen.sh"
fi

gmpc-plugin_src_install() {
	PLUGIN="${PN#gmpc}"
	PLUGIN="${PLUGIN%live}"
	PLUGIN="${PLUGIN//-}"

        # This makefile ignores DEST, so manual installation
        insinto "/usr/share/gmpc/plugins"
        doins "src/.libs/lib${PLUGIN}.so"
}

EXPORT_FUNCTIONS src_install
