EAPI=7

PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1

DESCRIPTION="Hosted coverage reports for Github, Bitbucket and Gitlab."
HOMEPAGE="https://github.com/codecov/codecov-python"
SRC_URI="https://github.com/codecov/codecov-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/requests[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        "

MY_PN="${PN}-python"
MY_P="${MY_PN}-${PV}"

S="${WORKDIR}/${MY_P}"
