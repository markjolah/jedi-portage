# Copyright 2019 UCAR

EAPI=7

inherit cmake-utils multilib

MY_PN="bufrlib"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="NCEP bufr library for reading/writing bufr files."
HOMEPAGE="https://github.com/JCSDA/bufrlib"
SRC_URI="https://github.com/JCSDA/bufrlib/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sys-devel/gcc[fortran]"

CMAKE_MAKEFILE_GENERATOR="emake"

S="${WORKDIR}/${MY_P}"

src_configure() {
        FFLAGS=${CFLAGS}
        cmake-utils_src_configure
}
