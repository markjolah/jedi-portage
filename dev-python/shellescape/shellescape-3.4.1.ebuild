EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Shell escape a string to safely use it as a token in a shell command (backport of Python shlex.quote) "
HOMEPAGE="https://github.com/chrissimpkins/shellescape"
SRC_URI="https://github.com/chrissimpkins/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
