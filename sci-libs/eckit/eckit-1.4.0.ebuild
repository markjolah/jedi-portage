EAPI=7

inherit git-r3 cmake-utils flag-o-matic

DESCRIPTION="A C++ toolkit that supports development of tools and applications at ECMWF"
HOMEPAGE="https://github.com/JCSDA/eckit"
EGIT_REPO_URI="https://github.com/JCSDA/eckit"
EGIT_COMMIT="${PV}.jcsda1"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-util/cmake
        dev-util/ecbuild
        virtual/mpi
        dev-vcs/git
        dev-cpp/eigen
        dev-libs/openssl
        net-misc/curl
        dev-libs/boost
        virtual/lapack
        dev-libs/libaio
        sys-devel/bison
        sys-devel/flex
        dev-lang/perl
        app-doc/doxygen
        virtual/pkgconfig
        sys-libs/ncurses
        sci-libs/netcdf
        sci-libs/netcdf-cxx
        sci-libs/netcdf-fortran
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-ecbuild-cmake-fix.patch"
	  "${FILESDIR}/${P}-new-cmake.patch" )

src_configure() {
    filter-flags -Wl,--as-needed -march=native
    CMAKE_BUILD_TYPE="Release"
    local mycmakeargs=(
        -DINSTALL_LIB_DIR="$(get_libdir)"
    )
    cmake-utils_src_configure
}
