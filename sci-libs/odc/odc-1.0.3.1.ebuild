EAPI=7

inherit cmake-utils flag-o-matic

CORE_V=$(ver_cut 1-3)
RV=$(ver_cut 4)
MY_V="${CORE_V}.jcsda${RV}"
MY_P=$PN-${MY_V}

DESCRIPTION="Package to read/write ODB data "
HOMEPAGE="https://github.com/JCSDA/${PN}"
SRC_URI="https://github.com/JCSDA/${PN}/archive/${MY_V}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-util/ecbuild"

PATCHES=( "${FILESDIR}/${PN}-${CORE_V}.cmake-install.patch" )

S="${WORKDIR}/${MY_P}"
CMAKE_BUILD_TYPE="release"
