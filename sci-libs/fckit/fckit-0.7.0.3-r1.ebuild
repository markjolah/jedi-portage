# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_STANDARD="90"

inherit git-r3 cmake-utils flag-o-matic fortran-2

DESCRIPTION="A Fortran toolkit for interoperating Fortran with C/C++"
HOMEPAGE="https://github.com/JCSDA/fckit"
EGIT_REPO_URI="https://github.com/JCSDA/fckit"
EGIT_BRANCH="release-stable"
EGIT_COMMIT="8502aaeec5b3012ab337b8b3f696733037d4072b"

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
    )
    cmake-utils_src_configure
}
