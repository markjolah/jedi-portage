EAPI=7

FORTRAN_NEEDED=fortran

inherit autotools flag-o-matic fortran-2

MY_P=PnetCDF
MY_V=$(ver_rs 1- _)

DESCRIPTION="PnetCDF is a high-performance parallel I/O library for accessing NetCDF format files"
HOMEPAGE="https://parallel-netcdf.github.io/"
SRC_URI="https://github.com/Parallel-NetCDF/${MY_P}/archive/checkpoint.${PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="fortran"

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}-checkpoint.${PV}"

pkg_setup() {
    fortran-2_pkg_setup
}

src_prepare() {
    eautoreconf
    default
}

src_configure() {
    export MPICH_FC=${FC}
    export FC=mpifort
    append-fflags $(test-flags-FC -fallow-argument-mismatch)
    NETCDF_INCLUDE_DIR=$(nc-config --includedir)
    export CPPFLAGS="-I$NETCDF_INCLUDE_DIR"
    econf --disable-netcdf4 \
        --enable-shared=yes \
        $(use_enable fortran) \
        --includedir=$EPREFIX/usr/include/pnetcdf
}
