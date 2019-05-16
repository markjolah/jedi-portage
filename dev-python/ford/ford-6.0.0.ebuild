EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

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
        dev-python/tqdm
        dev-python/pygments
        dev-python/beautifulsoup
        dev-python/jinja
        dev-python/markdown[pygments]
        dev-python/tqdm
        dev-python/md-environ
        dev-python/toposort
        "

