# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils flag-o-matic

DESCRIPTION="A library for numerical weather prediction and climate modelling"
HOMEPAGE="https://github.com/JCSDA-internal/atlas"
EGIT_REPO_URI="https://github.com/JCSDA-internal/atlas"
EGIT_BRANCH="release-stable"
#EGIT_COMMIT="e0b77091009dbc3281796b9e4b9d2a023fe28a5e"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="cgal eigen fftw"

DEPEND="dev-util/cmake
        dev-util/ecbuild
        virtual/mpi
        sci-libs/eckit
        sci-libs/fckit
        sys-devel/gcc[fortran,openmp]
        dev-lang/python
        cgal? ( sci-mathematics/cgal )
        eigen? ( dev-cpp/eigen )
        fftw? ( sci-libs/fftw )
"

src_configure() {
    CMAKE_BUILD_TYPE="Release"
    local mycmakeargs=(
        -DINSTALL_LIB_DIR="$(get_libdir)"
	-Decbuild_DIR="/usr/lib64/cmake/ecbuild"
    )
    cmake-utils_src_configure
}
