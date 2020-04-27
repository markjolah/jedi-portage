# Copyright 2019 UCAR

EAPI=7

inherit cmake-utils multilib

DESCRIPTION="NCEP bufr library for reading/writing bufr files."
HOMEPAGE="https://github.com/JCSDA/bufrlib"
SRC_URI="https://github.com/JCSDA/bufrlib/archive/v11.3.0.1.tar.gz"
RESTRICT="primaryuri"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sys-devel/gcc[fortran]"

MY_PN="bufrlib"
MY_P="${MY_PN}-${PV}"

CMAKE_MAKEFILE_GENERATOR="emake"

S="${WORKDIR}/${MY_P}"

src_configure() {
        FFLAGS=${CFLAGS}
        cmake-utils_src_configure
}
