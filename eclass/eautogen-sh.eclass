eautogen-sh_eautogen-sh() {
	local x
	local LOCAL_EXTRA_ECONF="${EXTRA_ECONF}"

	if [ -z "${ECONF_SOURCE}" ]; then
		ECONF_SOURCE="."
	fi
	if [ -x "${ECONF_SOURCE}/autogen.sh" ]; then
		if [ -e /usr/share/gnuconfig/ ]; then
			for x in $(find "${WORKDIR}" -type f '(' -name config.guess -o -name config.sub ')') ; do
				vecho " * econf: updating ${x/${WORKDIR}\/} with /usr/share/gnuconfig/${x##*/}"
				cp -f /usr/share/gnuconfig/${x##*/} ${x}
			done
		fi

		if [ ! -z "${CBUILD}" ]; then
			LOCAL_EXTRA_ECONF="--build=${CBUILD} ${LOCAL_EXTRA_ECONF}"
		fi

		if [ ! -z "${CTARGET}" ]; then
			LOCAL_EXTRA_ECONF="--target=${CTARGET} ${LOCAL_EXTRA_ECONF}"
		fi

		# if the profile defines a location to install libs to aside from default, pass it on.
		# if the ebuild passes in --libdir, they're responsible for the conf_libdir fun.
		LIBDIR_VAR="LIBDIR_${ABI}"
		if [ -n "${ABI}" -a -n "${!LIBDIR_VAR}" ]; then
			CONF_LIBDIR="${!LIBDIR_VAR}"
		fi
		unset LIBDIR_VAR
		if [ -n "${CONF_LIBDIR}" ] && [ "${*/--libdir}" == "$*" ]; then
			if [ "${*/--exec-prefix}" != "$*" ]; then
				local args="$(echo $*)"
				local -a pref=($(echo ${args/*--exec-prefix[= ]}))
				CONF_PREFIX=${pref}
				[ "${CONF_PREFIX:0:1}" != "/" ] && CONF_PREFIX="/${CONF_PREFIX}"
			elif [ "${*/--prefix}" != "$*" ]; then
				local args="$(echo $*)"
				local -a pref=($(echo ${args/*--prefix[= ]}))
				CONF_PREFIX=${pref}
				[ "${CONF_PREFIX:0:1}" != "/" ] && CONF_PREFIX="/${CONF_PREFIX}"
			else
				CONF_PREFIX="/usr"
			fi
			export CONF_PREFIX
			[ "${CONF_LIBDIR:0:1}" != "/" ] && CONF_LIBDIR="/${CONF_LIBDIR}"

			CONF_LIBDIR_RESULT="$(strip_duplicate_slashes ${CONF_PREFIX}${CONF_LIBDIR})"

			LOCAL_EXTRA_ECONF="--libdir=${CONF_LIBDIR_RESULT} ${LOCAL_EXTRA_ECONF}"
		fi

		## confcache unsupported

		vecho ./autogen.sh \
			--prefix=/usr \
			--host=${CHOST} \
			--mandir=/usr/share/man \
			--infodir=/usr/share/info \
			--datadir=/usr/share \
			--sysconfdir=/etc \
			--localstatedir=/var/lib \
			"$@" \
			${LOCAL_EXTRA_ECONF}

		./autogen.sh \
			--prefix=/usr \
			--host=${CHOST} \
			--mandir=/usr/share/man \
			--infodir=/usr/share/info \
			--datadir=/usr/share \
			--sysconfdir=/etc \
			--localstatedir=/var/lib \
			"$@"  \
			${LOCAL_EXTRA_ECONF} || die "eautogen-sh failed"
	else
		die "no autogen script found"
	fi
}

eautogen-sh_src_compile() {

	cd ${S}
	eautogen-sh || die "died running eautogen-sh, $FUNCNAME:autogen-sh"
	emake || die "died running emake, $FUNCNAME:emake"
}

EXPORT_FUNCTIONS eautogen-sh src_compile
