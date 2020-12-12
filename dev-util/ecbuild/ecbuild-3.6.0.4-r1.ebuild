EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="ECMWF CMake build scripts and modules"
HOMEPAGE="https://github.com/JCSDA-internal/ecbuild"
# SRC_URI="https://github.com/ecmwf/ecbuild/archive/${PV}.tar.gz"
# RESTRICT="primaryuri"
EGIT_REPO_URI="https://github.com/JCSDA-internal/ecbuild"
#EGIT_COMMIT="$(ver_cut 1-3).jcsda$(ver_cut 4)"
EGIT_COMMIT="5abe455feec18fc402e07b9c4704467785c37e7a"

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
