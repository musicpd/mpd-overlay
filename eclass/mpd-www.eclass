inherit webapp mpd-docs

if [[ "${PN##*-}" == "live" ]]; then
	if [[ -n "${ESVN_REPO_URI}" ]]; then
		inherit subversion
	elif [[ -n "${EDARCS_REPOSITORY}" ]]; then
		inherit darcs
	else
		die "Could not use $0 for this ebuild"
	fi

	mpd-www_pkg_postinst() {
		webapp_pkg_postinst
		
		einfo ""
		einfo "${PN} is installed in your webroot under ${PN}/,"
		einfo "you may want to symlink to it from ${PN/-live}."
		einfo ""		
	}
else
	mpd-www_pkg_postinst() {
		webapp_pkg_postinst
	}
fi

mpd-www_src_install() {
	webapp_src_preinst

	mpd-docs "$DOCS"
	cp -r . "${D}${MY_HTDOCSDIR}"

	webapp_src_install
}

EXPORT_FUNCTIONS src_install pkg_postinst
