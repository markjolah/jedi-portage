EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_PN="schema_salad"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Semantic Annotations for Linked Avro Data"
HOMEPAGE="https://github.com/common-workflow-language/schema_salad"
SRC_URI="https://github.com/common-workflow-language/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
         dev-python/ruamel-yaml[${PYTHON_USEDEP}]
         dev-python/rdflib[${PYTHON_USEDEP}]
         dev-python/rdflib-jsonld[${PYTHON_USEDEP}]
         dev-python/mistune[${PYTHON_USEDEP}]
         dev-python/CacheControl[${PYTHON_USEDEP}]
         dev-python/lockfile[${PYTHON_USEDEP}]
         dev-python/six[${PYTHON_USEDEP}]
         dev-python/typing-extensions[${PYTHON_USEDEP}]
         "

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
S="${WORKDIR}/${MY_P}"
