EAPI=7

inherit autotools

MY_PN=ParallelIO
SHORT_P=pio
MY_V=$(ver_rs 1- _)
MY_P=${SHORT_P}-${PV}

DESCRIPTION="A high-level Parallel I/O Library for structured grid applications"
HOMEPAGE="https://ncar.github.io/ParallelIO/"
SRC_URI="https://github.com/NCAR/${MY_PN}/releases/download/${SHORT_P}${MY_V}/${MY_P}.tar.gz"
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

PATCHES=( ${FILESDIR}/${P}-uthash.patch )

src_prepare() {
	rm src/clib/uthash.h
    default
    eautoreconf
}

src_configure() {
    FC=mpifort CC=mpicc econf $(use_enable fortran) \
          --with-pic \
          --enable-netcdf-integration
}
