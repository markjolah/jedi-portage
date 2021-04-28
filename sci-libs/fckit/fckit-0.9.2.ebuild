# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils flag-o-matic fortran-2

DESCRIPTION="A Fortran toolkit for interoperating Fortran with C/C++"
HOMEPAGE="https://github.com/ecmwf/fckit"
SRC_URI="https://github.com/ecmwf/${PN}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-util/cmake
        dev-util/ecbuild
        virtual/mpi
        sci-libs/eckit
        dev-lang/python"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup() {
    fortran-2_pkg_setup
}

src_configure() {
    CMAKE_BUILD_TYPE="Release"
    local mycmakeargs=(
        -DINSTALL_LIB_DIR="$(get_libdir)"
	-Decbuild_DIR=/usr/lib64/cmake/ecbuild
    )
    cmake-utils_src_configure
}
