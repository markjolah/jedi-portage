EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="Implements a topological sort algorithm."
HOMEPAGE="https://pypi.org/project/toposort/"
SRC_URI="https://files.pythonhosted.org/packages/e5/d8/9bc1598ddf74410beba243ffeaee8d0b3ca7e9ac5cefe77367da497433e1/${P}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        "

