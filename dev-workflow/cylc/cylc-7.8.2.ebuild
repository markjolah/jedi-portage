EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Cylc is a workflow engine for cycling systems."
HOMEPAGE="https://cylc.github.io/"
SRC_URI="https://github.com/cylc/cylc-flow/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="gui doc test"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pyopenssl
        dev-python/requests
        dev-python/urllib3
        gui? ( dev-python/pygtk 
               dev-python/pygraphviz )
        test? ( dev-python/mock )
        doc? ( dev-python/sphinx )
        "

S="${WORKDIR}/cylc-flow-${PV}"
