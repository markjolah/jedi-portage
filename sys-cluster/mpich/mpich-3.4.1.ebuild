# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_NEEDED=fortran
FORTRAN_STANDARD="77 90"

inherit fortran-2 multilib-minimal multilib autotools flag-o-matic

MY_PV=${PV/_/}
DESCRIPTION="A high performance and portable MPI implementation"
HOMEPAGE="http://www.mpich.org/"
SRC_URI="http://www.mpich.org/static/downloads/${PV}/${P}.tar.gz"

SLOT="0"
LICENSE="mpich2"
KEYWORDS="~amd64 ~arm64 ~hppa ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+cxx doc fortran mpi-threads romio threads test"

COMMON_DEPEND="
	>=dev-libs/libaio-0.3.109-r5[${MULTILIB_USEDEP}]
	>=sys-apps/hwloc-2.0.2[${MULTILIB_USEDEP}]
	romio? ( net-fs/nfs-utils )"

DEPEND="${COMMON_DEPEND}
	dev-lang/perl
	sys-devel/libtool"

RDEPEND="${COMMON_DEPEND}
	!sys-cluster/mpich2
	!sys-cluster/openmpi
	!sys-cluster/nullmpi"

S="${WORKDIR}"/${PN}-${MY_PV}

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/mpicxx.h
	/usr/include/mpi.h
	/usr/include/opa_config.h
)

PATCHES=(
#	"${FILESDIR}"/${PN}-3.3-add-external-libdir-parameter.patch
)

FORTRAN_MODULE_PATH="mpi/fortran"  #Install Fortran modules under subdirectory to prevent defatult inclusion from non compatable compilers

src_prepare() {
	default

	# Using MPICHLIB_LDFLAGS doesn't seem to fully work.
	sed -i 's| *@WRAPPER_LDFLAGS@ *||' \
		src/packaging/pkgconfig/mpich.pc.in \
		src/env/*.in \
		|| die
	sed -i -e "s|fflags= *@WRAPPER_FFLAGS@ *|fflags= -I\${includedir}/${FORTRAN_MODULE_PATH} @WRAPPER_FFLAGS@ |" \
               -e "s|fcflags= *@WRAPPER_FCFLAGS@ *|fcflags= -I\${includedir}/${FORTRAN_MODULE_PATH} @WRAPPER_FCFLAGS@ |" \
		src/packaging/pkgconfig/mpich.pc.in || die
        sed -i -e "s|FFLAGS=\"\$WRAPPER_FFLAGS\"|FFLAGS=\"\$WRAPPER_FFLAGS $(test-flags-F77 -fallow-argument-mismatch)\"|" \
               -e "s|FCLAGS=\"\$WRAPPER_FCLAGS\"|FCLAGS=\"\$WRAPPER_FCLAGS $(test-flags-FC  -fallow-argument-mismatch)\"|" test/mpi/configure.ac || die
	# Fix m4 files to satisfy lib dir with multilib.
	touch -r src/pm/hydra/confdb/aclocal_libs.m4 \
		confdb/aclocal_libs.m4 \
		|| die
	cp -fp confdb/aclocal_libs.m4 \
		src/pm/hydra/confdb/aclocal_libs.m4 \
		|| die
	cp -fp confdb/aclocal_libs.m4 \
		src/pm/hydra/mpl/confdb/aclocal_libs.m4 \
		|| die
	cd src/pm/hydra/mpl; eautoreconf; cd -
	cd src/pm/hydra; eautoreconf; cd -
	eautoreconf
}

multilib_src_configure() {
	# The configure statements can be somewhat confusing, as they
	# don't all show up in the top level configure, however, they
	# are picked up in the children directories.  Hence the separate
	# local vars.

	local c=
	if use mpi-threads; then
		# MPI-THREAD requries threading.
		c="${c} --with-thread-package=pthreads"
		c="${c} --enable-threads=runtime"
	else
		if use threads ; then
			c="${c} --with-thread-package=pthreads"
		else
			c="${c} --with-thread-package=none"
		fi
		c="${c} --enable-threads=single"
	fi

	c="${c} --sysconfdir=${EPREFIX}/etc/${PN}"

	export MPICHLIB_CFLAGS="${CFLAGS}"
	export MPICHLIB_CPPFLAGS="${CPPFLAGS}"
	export MPICHLIB_CXXFLAGS="${CXXFLAGS}"
	export MPICHLIB_FFLAGS="${FFLAGS} $(test-flags-F77 -fallow-argument-mismatch)"
	export MPICHLIB_FCFLAGS="${FCFLAGS} $(test-flags-FC -fallow-argument-mismatch)"
	export MPICHLIB_LDFLAGS="${LDFLAGS}"
	export MPICH_MPIFORT_FCFLAGS="-I/usr/include/${FORTRAN_MODULE_PATH}"
	unset CFLAGS CPPFLAGS CXXFLAGS FFLAGS FCFLAGS LDFLAGS
	append-fflags

	ECONF_SOURCE=${S} econf \
		--enable-shared \
		--with-hwloc-prefix="${EPREFIX}/usr" \
		--with-hwloc-libdir="$(get_libdir)" \
		--with-common-libdir="$(get_libdir)" \
		--with-prefix-libdir="$(get_libdir)" \
		--with-izem-libdir="$(get_libdir)" \
		--with-device=ch4:ofi \
		--with-libfabric="${EPREFIX}/usr" \
		--with-fiprovider-libdir="$(get_libdir)" \
		${c} \
		--with-pm=hydra \
		--disable-fast \
		--enable-versioning \
		--disable-wrapper-rpath \
		$(use_enable romio) \
		$(use_enable cxx) \
		$(use_enable fortran fortran all)
}

multilib_src_test() {
	use test && emake -j1 check
}

multilib_src_install() {
	default

	# fortran header cannot be wrapped (bug #540508), workaround part 1
	if  use fortran; then
		if multilib_is_native_abi; then
			mkdir -p "${T}"/fortran || die
			mv "${ED}"/usr/include/mpif* "${T}"/fortran || die
			mv "${ED}"/usr/include/*.mod "${T}"/fortran || die
		else
			rm "${ED}"/usr/include/mpif* "${ED}"/usr/include/*.mod || die
		fi
	fi
}

multilib_src_install_all() {
	# fortran header cannot be wrapped (bug #540508), workaround part 2
	if use fortran; then
		mkdir -p "$ED/usr/include/${FORTRAN_MODULE_PATH}"
		mv "${T}"/fortran/* "$ED/usr/include/$FORTRAN_MODULE_PATH" || die
	fi

	einstalldocs
	newdoc src/pm/hydra/README README.hydra
	if use romio; then
		newdoc src/mpi/romio/README README.romio
	fi

	if ! use doc; then
		rm -rf "${ED}"/usr/share/doc/${PF}/www* || die
	fi
}
