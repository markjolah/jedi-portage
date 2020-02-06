EAPI=7
PYTHON_COMPAT=( python3_{5,6,7,8} )

inherit distutils-r1

DESCRIPTION="Pythonic interface to netCDF4 via h5py"
HOMEPAGE="https://github.com/shoyer/h5netcdf"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	dev-python/h5py[${PYTHON_USEDEP}]
"

DEPEND="
    ${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

