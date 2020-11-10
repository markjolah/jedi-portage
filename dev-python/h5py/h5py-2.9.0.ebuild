# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1 flag-o-matic git-r3

DESCRIPTION="Simple Python interface to HDF5 files"
HOMEPAGE="https://www.h5py.org"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
EGIT_REPO_URI="https://github.com/h5py/h5py"
EGIT_BRANCH="master"

# disable mpi until mpi4py gets python3_8
#IUSE="examples mpi"
IUSE=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

#RDEPEND="sci-libs/hdf5:=[mpi=,hl(+)]
RDEPEND="sci-libs/hdf5:=[hl(+)]
         dev-python/numpy[${PYTHON_USEDEP}]
         dev-python/six[${PYTHON_USEDEP}]
         "

BDEPEND="dev-python/pkgconfig[${PYTHON_USEDEP}]
         dev-python/setuptools[${PYTHON_USEDEP}]
         dev-python/cython[${PYTHON_USEDEP}]
         dev-python/cached-property[${PYTHON_USEDEP}]"

DEPEND="${BDEPEND}"


python_prepare_all() {
        append-cflags -fno-strict-aliasing
        distutils-r1_python_prepare_all
}

python_configure() {
        esetup.py configure
}