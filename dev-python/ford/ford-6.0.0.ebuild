EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="Automatically generates FORtran Documentation from comments within the code."
HOMEPAGE="https://github.com/Fortran-FOSS-Programmers/ford"
SRC_URI="https://github.com/Fortran-FOSS-Programmers/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/graphviz
        dev-python/tqdm[${PYTHON_USEDEP}]
        dev-python/pygments[${PYTHON_USEDEP}]
        dev-python/beautifulsoup[${PYTHON_USEDEP}]
        dev-python/jinja[${PYTHON_USEDEP}]
        dev-python/markdown[${PYTHON_USEDEP}]
        dev-python/markdown-include[${PYTHON_USEDEP}]
        dev-python/tqdm[${PYTHON_USEDEP}]
        dev-python/md-environ[${PYTHON_USEDEP}]
        dev-python/toposort[${PYTHON_USEDEP}]
        "

