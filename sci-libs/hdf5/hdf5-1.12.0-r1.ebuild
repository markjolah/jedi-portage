# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

FORTRAN_NEEDED=fortran

inherit cmake-utils fortran-2

MY_P=${PN}-${PV/_p/-patch}
MAJOR_P=${PN}-$(ver_cut 1-2)

DESCRIPTION="General purpose library and file format for storing scientific data"
HOMEPAGE="http://www.hdfgroup.org/HDF5/"
SRC_URI="http://www.hdfgroup.org/ftp/HDF5/releases/${MAJOR_P}/${MY_P}/src/${MY_P}.tar.bz2"

LICENSE="NCSA-HDF"
SLOT="0/${PV%%_p*}"
KEYWORDS="~alpha amd64 ~arm arm64 ia64 ppc ppc64 sparc x86 ~amd64-linux ~x86-linux"
IUSE="cxx examples fortran +hl mpi szip threads tools test zlib"

REQUIRED_USE="
    cxx? ( !mpi ) mpi? ( !cxx )
    threads? ( !cxx !mpi !fortran !hl )"

RDEPEND="
    mpi? ( virtual/mpi[romio] )
    szip? ( virtual/szip )
    zlib? ( sys-libs/zlib:0= )"

DEPEND="${RDEPEND}
    sys-devel/libtool:2
    >=sys-devel/autoconf-2.69"

S="${WORKDIR}/${MY_P}"

CMAKE_BUILD_TYPE=Release

pkg_setup() {
    use fortran && fortran-2_pkg_setup

    if use mpi; then
        if has_version 'sci-libs/hdf5[-mpi]'; then
            ewarn "Installing hdf5 with mpi enabled with a previous hdf5 with mpi disabled may fail."
            ewarn "Try to uninstall the current hdf5 prior to enabling mpi support."
        fi
        export CC=mpicc
        use fortran && export FC=mpif90
    elif has_version 'sci-libs/hdf5[mpi]'; then
        ewarn "Installing hdf5 with mpi disabled while having hdf5 installed with mpi enabled may fail."
        ewarn "Try to uninstall the current hdf5 prior to disabling mpi support."
    fi
}

src_prepare() {
    cd ${S} && cmake_comment_add_subdirectory java
    cd ${S}/test && cmake_comment_add_subdirectory java
    cmake-utils_src_prepare
}

src_configure() {
    export FFLAGS=${CFLAGS}
    local mycmakeargs=(
            -DCMAKE_INSTALL_PREFIX=$EPREFIX/usr
            -DBUILD_SHARED_LIBS=1
            -DBUILD_STATIC_LIBS=0
            -DHDF5_INSTALL_INCLUDE_DIR=$EPREFIX/usr/include
            -DHDF5_INSTALL_LIB_DIR=$EPREFIX/usr/lib64
            -DHDF5_ENABLE_Z_LIB_SUPPORT=$(usex zlib)
            -DHDF5_ENABLE_SZIP_SUPPORT=$(usex szip)
            -DBUILD_TESTING=$(usex test)
            -DHDF5_BUILD_TOOLS=$(usex tools)
            -DHDF5_BUILD_EXAMPLES=$(usex examples)
            -DHDF5_ENABLE_PARALLEL=$(usex mpi)
            -DHDF5_ENABLE_THREADSAFE=$(usex threads)
            -DHDF5_BUILD_HL_LIB=$(usex hl)
            -DHDF5_BUILD_CPP_LIB=$(usex cxx)
            -DHDF5_BUILD_FORTRAN=$(usex fortran)
        )
    cmake-utils_src_configure
}


