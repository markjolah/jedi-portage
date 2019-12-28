EAPI=7

inherit cmake-utils

DESCRIPTION="ECMWF CMake build scripts and modules"
HOMEPAGE="https://github.com/JCSDA/ecbuild"
SRC_URI="https://github.com/ecmwf/ecbuild/archive/${PV}.tar.gz"
RESTRICT="primaryuri"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
    CMAKE_BUILD_TYPE="Release"
    cmake-utils_src_configure
}
