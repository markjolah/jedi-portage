# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

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

BDEPEND="dev-python/pkgconfig"
#	mpi? ( virtual/mpi )

DEPEND="dev-python/cython[${PYTHON_USEDEP}]
		dev-python/cached-property[${PYTHON_USEDEP}]"
#	mpi? ( dev-python/mpi4py[${PYTHON_USEDEP}] )

# PATCHES="${FILESDIR}/h5py-2.10.0-tests.patch"

# DOCS=( README.rst AUTHORS ANN.rst )

# distutils_enable_tests setup.py
# distutils_enable_sphinx docs --no-autodoc

#pkg_setup() {
#	use mpi && export CC=mpicc
#}

# python_prepare_all() {
# 	append-cflags -fno-strict-aliasing
# 	distutils-r1_python_prepare_all
# }
#
# python_configure() {
# #	esetup.py configure $(usex mpi --mpi '')
# 	append-cflags -fcommon
# 	esetup.py configure
# }

# python_test() {
# 	esetup.py test || die "Tests fail with ${EPYTHON}"
# 	# tests generate .pytest_cache which should not be installed
# 	rm -r "${BUILD_DIR}/lib/.pytest_cache" || die
# }

# python_install_all() {
# 	use examples && dodoc -r examples
#
# 	distutils-r1_python_install_all
# }