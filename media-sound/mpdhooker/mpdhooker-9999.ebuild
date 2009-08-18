# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=2

inherit git autotools eutils

DESCRIPTION="mpdhooker is a hooker daemon for mpd. It polls Mpd for information and runs hooks passing arguments on their command
line."
HOMEPAGE="http://github.com/alip/mpdhooker/tree/master"
EGIT_REPO_URI="git://github.com/alip/mpdhooker.git"
IUSE="examples"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
SLOT="0"

RDEPEND=">=dev-libs/libdaemon-0.13
	>=dev-libs/glib-2.18"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	eautoreconf
}

src_install() {
	dodir /etc/mpdhooker/hooks/
	fowners mpd:audio /etc/mpdhooker/
	fperms 750 /etc/mpdhooker/
	keepdir /etc/mpdhooker/hooks

	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc README.mkd
	
	if use examples ; then
		insinto /usr/share/doc/${PF}/examples/
		cp -Rdp "${S}/conf/hooks/" "${D}/usr/share/doc/${PF}/examples/"
	fi
	
	insinto /etc/mpdhooker/
	newins conf/mpdhooker.conf mpdhooker.conf || die "Failed copying config
	file"

	# Fix up config file. Just sets the pidfile option to use /var/run.
	sed -i -e "s:^# pid:pid:" "${D}"/etc/mpdhooker/mpdhooker.conf \
	|| die "Failed doing sed on config"


	newinitd "${FILESDIR}"/mpdhooker.rc mpdhooker || die "Failed installing
	newinitd"

}

pkg_postinst() {
	elog "You'll probably want to add mpdhooker to your startup."
	elog "The config file is located at /etc/mpdhooker/mpdhooker.conf."
	
	if use examples ; then
		elog "Example hooks have been installed to
		${D}/usr/share/doc/${PF}/examples/hooks/ and can be copied to
		${D}/etc/mpdhooker/hooks/ for use"
	fi
}
