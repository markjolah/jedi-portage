# Copyright 2019 UCAR

EAPI=7

inherit git-r3 cmake-utils multilib

DESCRIPTION="NCEP bufr library for reading/writing bufr files."
HOMEPAGE="https://github.com/JCSDA/bufrlib"
EGIT_REPO_URI="https://github.com/JCSDA/bufrlib.git"
EGIT_BRANCH="master"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sys-devel/gcc[fortran]"

CMAKE_MAKEFILE_GENERATOR="emake"

src_configure() {
        FFLAGS=${CFLAGS}
        cmake-utils_src_configure
}
