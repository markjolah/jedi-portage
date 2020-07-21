# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1

DESCRIPTION="N-D labeled arrays and datasets in Python"
HOMEPAGE="http://xarray.pydata.org/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test dask"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dask? ( dev-python/dask[${PYTHON_USEDEP}] )
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		sci-libs/scipy[${PYTHON_USEDEP}]
	)"

PATCHES=(
	"${FILESDIR}/${PN}-0.10.8-skip-broken-test.patch"
)

python_test() {
	pytest -v || die
}
