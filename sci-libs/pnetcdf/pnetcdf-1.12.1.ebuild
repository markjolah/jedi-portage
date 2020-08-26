EAPI=7

inherit autotools flag-o-matic

MY_P=PnetCDF
MY_V=$(ver_rs 1- _)

DESCRIPTION="netCDF is a high-performance parallel I/O library for accessing NetCDF format files"
HOMEPAGE="https://parallel-netcdf.github.io/"
SRC_URI="https://github.com/Parallel-NetCDF/${MY_P}/archive/checkpoint.${PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}-checkpoint.${PV}"

src_prepare() {
    eautoreconf
    default
}
src_configure() {
    append-fflags $(test-flags-FC -fallow-argument-mismatch)
    econf --disable-netcdf4 --enable-shared=yes --includedir=$EPREFIX/usr/include/pnetcdf
}
