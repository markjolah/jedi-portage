EAPI=7

PYTHON_COMPAT=( python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="Python ISO 8601 full-specification parser and data model/manipulation utilities."
HOMEPAGE="https://github.com/metomi/isodatetime"
SRC_URI="https://github.com/metomi/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pytest-runner
        "

