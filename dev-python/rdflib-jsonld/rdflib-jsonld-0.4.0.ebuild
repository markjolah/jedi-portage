EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_PN="schema_salad"

DESCRIPTION="JSON-LD parser and serializer plugins for RDFLib (Python 2.6+) "
HOMEPAGE="https://github.com/RDFLib/rdflib-jsonld"
SRC_URI="https://github.com/RDFLib/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/rdflib"
