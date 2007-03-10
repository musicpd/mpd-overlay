## For compatibility with paludis
_strip_duplicate_slashes() {
        if [[ -n $1 ]] ; then
                local removed=$1
                while [[ ${removed} == *//* ]] ; do
                        removed=${removed//\/\///}
                done
                echo ${removed}
        fi
}

eautogen-sh() {
	local x
	local LOCAL_EXTRA_ECONF="${EXTRA_ECONF}"

	if [ -z "${ECONF_SOURCE}" ]; then
		ECONF_SOURCE="."
	fi

	if [ -f "${ECONF_SOURCE}/autogen.sh" ]; then
		if [ -e /usr/share/gnuconfig/ ]; then
			for x in $(find "${WORKDIR}" -type f '(' -name config.guess -o -name config.sub ')') ; do
				echo " * econf: updating ${x/${WORKDIR}\/} with /usr/share/gnuconfig/${x##*/}"
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

			CONF_LIBDIR_RESULT="$(_strip_duplicate_slashes ${CONF_PREFIX}${CONF_LIBDIR})"

			LOCAL_EXTRA_ECONF="--libdir=${CONF_LIBDIR_RESULT} ${LOCAL_EXTRA_ECONF}"
		fi

		## confcache unsupported

		echo ./autogen.sh \
			--prefix=/usr \
			--host=${CHOST} \
			--mandir=/usr/share/man \
			--infodir=/usr/share/info \
			--datadir=/usr/share \
			--sysconfdir=/etc \
			--localstatedir=/var/lib \
			--disable-dependency-tracking \
			"$@" \
			${LOCAL_EXTRA_ECONF}

		## Some sed magic, almost no autogen script traps as necessary.
		grep '^trap.*$' autogen.sh&>/dev/null
		if [[ $? -ne 0 ]]; then
			sed -ie 's%#!/bin/\(.*\)$%#!/bin/\1\ntrap "exit 1" HUP INT QUIT ABRT KILL ALRM TERM%' autogen.sh
		fi
		bash autogen.sh \
			--prefix=/usr \
			--host=${CHOST} \
			--mandir=/usr/share/man \
			--infodir=/usr/share/info \
			--datadir=/usr/share \
			--sysconfdir=/etc \
			--localstatedir=/var/lib \
			--disable-dependency-tracking \
			"$@"  \
			${LOCAL_EXTRA_ECONF} || die "eautogen-sh failed"
	else
		die "no autogen script found"
	fi
}

eautogen-sh_src_compile() {
	cd ${S}
	if [[ ! -f configure ]]; then
		eautogen-sh || die "died running eautogen-sh, $FUNCNAME:autogen-sh"
	fi
	if [[ ! -f Makefile ]]; then
		econf || die "diesd running econf, $FUNCNAME: econf"
	fi
	emake || die "died running emake, $FUNCNAME:emake"
}

EXPORT_FUNCTIONS src_compile
