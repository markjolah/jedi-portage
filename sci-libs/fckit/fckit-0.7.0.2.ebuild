# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils flag-o-matic

DESCRIPTION="A Fortran toolkit for interoperating Fortran with C/C++"
HOMEPAGE="https://github.com/JCSDA/fckit"
EGIT_REPO_URI="https://github.com/JCSDA/fckit"
EGIT_BRANCH="release-stable"
EGIT_COMMIT="8383afcbb4ad3675249313c52e2c57a0e4f3ad2c"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-util/cmake
        dev-util/ecbuild
        virtual/mpi
        sci-libs/eckit
        sys-devel/gcc[fortran]
        dev-lang/python
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
    CMAKE_BUILD_TYPE="Release"
    local mycmakeargs=(
        -DINSTALL_LIB_DIR="$(get_libdir)"
    )
    cmake-utils_src_configure
}
