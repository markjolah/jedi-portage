# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils flag-o-matic

DESCRIPTION="A C++ toolkit that supports development of tools and applications at ECMWF"
HOMEPAGE="https://github.com/ecmwf/eckit"
SRC_URI="https://github.com/ecmwf/${PN}/archive/${PV}.tar.gz"

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
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
    filter-flags -Wl,--as-needed -march=native
    CMAKE_BUILD_TYPE="Release"
    local mycmakeargs=(
        -DINSTALL_LIB_DIR="$(get_libdir)"
    )
    cmake-utils_src_configure
}
