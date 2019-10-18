EAPI=7

inherit autotools

MY_PN=ParallelIO
SHORT_P=pio
MY_V=$(ver_rs 1- _)
MY_P=${MY_PN}-${PV}

DESCRIPTION="A high-level Parallel I/O Library for structured grid applications"
HOMEPAGE="https://ncar.github.io/ParallelIO/"
SRC_URI="https://github.com/NCAR/${MY_P}/archive/${SHORT_P}${MY_V}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+fortran +pnetcdf +mpiio"
 
DEPEND="dev-util/cmake
        fortran? ( sys-devel/gcc[fortran] )
        pnetcdf? ( sci-libs/pnetcdf )
        virtual/mpi[romio]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${SHORT_P}${MY_V}"

src_prepare() {
    eautoreconf
    default
}

src_configure() {
    FC=mpifort CC=mpicc econf $(use_enable fortran) \
          --with-pic
}
