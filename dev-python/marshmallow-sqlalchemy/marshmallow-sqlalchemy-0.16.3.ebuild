# Copyright 2019 JCSDA
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1


DESCRIPTION="SQLAlchemy integration with marshmallow"
HOMEPAGE="https://marshmallow-sqlalchemy.readthedocs.io/"
SRC_URI="https://github.com/marshmallow-code/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/marshmallow-2[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        >=dev-python/sqlalchemy-0.9.7[${PYTHON_USEDEP}]"
