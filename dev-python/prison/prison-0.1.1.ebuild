# Copyright 2019 JCSDA
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python rison encoder/decoder "
HOMEPAGE="https://github.com/betodealmeida/python-rison"
SRC_URI="https://files.pythonhosted.org/packages/06/6b/56f9c885ccb3e337056e7cbc94628d99214439853432e492c8318166f5b6/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
         dev-python/six[${PYTHON_USEDEP}]
         "

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
