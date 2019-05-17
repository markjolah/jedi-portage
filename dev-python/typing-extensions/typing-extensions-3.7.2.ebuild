EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_PN="typing_extensions"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Work related to PEP 484: typing.py (released via PyPI) and issue tracker"
HOMEPAGE="https://github.com/python/typing/blob/master/typing_extensions/README.rst"
SRC_URI="https://files.pythonhosted.org/packages/fa/aa/229f5c82d17d10d4ef318b5c22a8626a1c78fc97f80d3307035cf696681b/${MY_P}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="PSF-2.4"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
