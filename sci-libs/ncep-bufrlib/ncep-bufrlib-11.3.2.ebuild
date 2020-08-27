# Copyright 2019-2020 UCAR

EAPI=7

inherit cmake-utils multilib fortran-2

MY_PN="bufrlib"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="NCEP bufr library for reading/writing bufr files."
HOMEPAGE="https://github.com/JCSDA/bufrlib"
SRC_URI="https://github.com/JCSDA/bufrlib/archive/bufr_v${PV}.tar.gz -> ${MY_P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""

CMAKE_MAKEFILE_GENERATOR="emake"

S=$WORKDIR/${MY_PN}-bufr_v${PV}

pkg_setup() {
    fortran-2_pkg_setup
}

src_configure() {
    export FFLAGS=${CFLAGS}
    cmake-utils_src_configure
}