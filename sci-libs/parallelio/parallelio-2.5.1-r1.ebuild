EAPI=7

FORTRAN_STANDARD=90

inherit autotools flag-o-matic fortran-2

MY_PN=ParallelIO
SHORT_P=pio
MY_PV=$(ver_rs 1- _)
MY_P=${MY_PN}-${SHORT_P}_${MY_PV}

DESCRIPTION="A high-level Parallel I/O Library for structured grid applications"
HOMEPAGE="https://ncar.github.io/ParallelIO/"
SRC_URI="https://github.com/NCAR/${MY_PN}/archive/${SHORT_P}_${MY_PV}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="fortran pnetcdf mpiio netcdf"

DEPEND="dev-util/cmake
        dev-libs/uthash
        fortran? ( sys-devel/gcc[fortran] )
        pnetcdf? ( sci-libs/pnetcdf )
        netcdf?  ( sci-libs/netcdf[mpi] )
        mpiio? ( virtual/mpi[romio] )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

PATCHES=( ${FILESDIR}/${P}-uthash.patch
          ${FILESDIR}/${P}-multiple-definition-error.patch )

pkg_setup() {
    fortran-2_pkg_setup
}

src_prepare() {
    rm src/clib/uthash.h
    default
    eautoreconf
}

src_configure() {
    export MPICH_FC=${FC}
    export MPICH_CC=${CC}
    append-fflags $(test-flags-FC -fallow-argument-mismatch)
    if use netcdf; then
        NETCDF_INCLUDE_DIR=$(nc-config --includedir)
        export CPPFLAGS="-I$NETCDF_INCLUDE_DIR $CPPFLAGS"
    fi
    if use pnetcdf; then
        PNETCDF_INCLUDE_DIR=$(pnetcdf-config --includedir)
        export CPPFLAGS="-I$PNETCDF_INCLUDE_DIR $CPPFLAGS"
    fi
    FC=mpifort CC=mpicc econf \
        $(use_enable fortran) \
        --with-pic \
        --enable-netcdf-integration \
        --includedir=$EPREFIX/usr/include/pio

}

src_compile() {
    export MPICH_FC=${FC}
    export MPICH_CC=${CC}
    default
}
