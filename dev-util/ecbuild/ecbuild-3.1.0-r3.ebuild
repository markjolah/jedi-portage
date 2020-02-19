EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="ECMWF CMake build scripts and modules"
HOMEPAGE="https://github.com/JCSDA/ecbuild"
# SRC_URI="https://github.com/ecmwf/ecbuild/archive/${PV}.tar.gz"
# RESTRICT="primaryuri"
EGIT_REPO_URI="https://github.com/JCSDA/ecbuild"
EGIT_COMMIT="3.1.0.jcsda3"


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