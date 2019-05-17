EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_PN="bagit-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Work with BagIt packages from Python. "
HOMEPAGE="https://github.com/LibraryOfCongress/bagit-python"
SRC_URI="https://github.com/LibraryOfCongress/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
    sed -i -e"s:use_scm_version=True:version=\"${PV}\":" setup.py || die
    distutils-r1_python_prepare_all
}
