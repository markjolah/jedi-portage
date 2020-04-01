# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7,8} )

inherit distutils-r1

MY_PN="netCDF4"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python/numpy interface to the netCDF C library"
HOMEPAGE="https://unidata.github.io/netcdf4-python/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test mpi pnetcdf opendap szip"
REQUIRED_USE="pnetcdf? ( mpi )"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
         dev-python/cftime[${PYTHON_USEDEP}]
         sci-libs/hdf5
         sci-libs/netcdf:=[hdf,hdf5]"
DEPEND="sci-libs/hdf5
        sci-libs/netcdf
        virtual/jpeg
        szip? ( sci-libs/hdf5[szip] )
        sys-libs/zlib
        mpi? ( dev-python/mpi4py
               sci-libs/netcdf[mpi]
               pnetcdf? ( sci-libs/pnetcdf
                          sci-libs/netcdf[pnetcdf] )
               !pnetcdf? ( sci-libs/hdf5[mpi] )
             )
        pnetcdf? ( sci-libs/pnetcdf
                   sci-libs/netcdf[pnetcdf] )
        opendap? ( net-misc/curl )
        ${RDEPEND}"

S="${WORKDIR}"/${MY_P}

python_compile() {
    local -x HDF5_DIR="$EPREFIX/usr/"
    local -x USE_NCCONFIG=1
    distutils-r1_python_compile
}

python_test() {
    cd test || die
    ${PYTHON} run_all.py || die
}

python_install() {
    local -x HDF5_DIR="$EPREFIX/usr/"
    distutils-r1_python_install
}
