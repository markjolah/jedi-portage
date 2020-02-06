EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python-Markdown extension to use environment variables."
HOMEPAGE="https://github.com/cmacmackin/md-environ"
SRC_URI="https://github.com/cmacmackin/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/markdown
        "

