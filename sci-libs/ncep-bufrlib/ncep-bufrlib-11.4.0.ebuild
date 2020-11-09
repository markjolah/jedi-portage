# Copyright 2019-2020 UCAR

EAPI=7

inherit git-r3 cmake-utils fortran-2

DESCRIPTION="NCEP bufr library for reading/writing bufr files."
HOMEPAGE="https://github.com/NOAA-EMC/NCEPLIBS-bufr"
EGIT_REPO_URI="https://github.com/NOAA-EMC/NCEPLIBS-bufr"
EGIT_COMMIT="bufr_v${PV}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""

CMAKE_MAKEFILE_GENERATOR="emake"

PATCHES=( "${FILESDIR}/${P}-include-installdirs.patch" )

pkg_setup() {
    fortran-2_pkg_setup
}

src_configure() {
    export FFLAGS=${CFLAGS}
    local mycmakeargs=( BUILD_SHARED_LIBS=1 )

    cmake-utils_src_configure
}
