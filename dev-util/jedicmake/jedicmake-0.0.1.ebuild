EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="JCSDA CMake modules and build functionality for the JEDI system"
HOMEPAGE="https://github.com/JCSDA/jedi-cmake"
EGIT_REPO_URI="https://markjolah@github.com/JCSDA/jedi-cmake"
EGIT_COMMIT="6ef401777a207f8a7293af87967af7afc0c11338"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND="${DEPEND}"
BDEPEND=""
