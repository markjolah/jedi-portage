# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_STANDARD="77 90"

inherit autotools eutils fortran-2

DESCRIPTION="Scientific library and interface for array oriented data access"
HOMEPAGE="https://www.unidata.ucar.edu/software/netcdf/"
SRC_URI="https://github.com/Unidata/netcdf-fortran/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="UCAR-Unidata"
SLOT="0/6"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="examples static-libs mpi"

RDEPEND="sci-libs/netcdf[mpi=]"
DEPEND="${RDEPEND}
    dev-lang/cfortran
"

pkg_setup() {
    fortran-2_pkg_setup
}

src_prepare() {
    default
    eautoreconf
}

src_configure() {
    if use mpi ; then
        export MPICH_FC=${FC}
        export FC="mpifort"
    fi
    NETCDF_INCLUDE_DIR=$(nc-config --includedir)
    export CPPFLAGS="-I$NETCDF_INCLUDE_DIR"
    econf $(use_enable static-libs static) \
        --includedir=$EPREFIX/usr/include/netcdf
}

src_install() {
    default
    use examples && dodoc -r examples
    prune_libtool_files
}
