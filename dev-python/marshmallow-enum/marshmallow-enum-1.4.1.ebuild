# Copyright 2019 JCSDA
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

MY_PN="marshmallow_enum"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Enum handling for Marshmallow"
HOMEPAGE="https://github.com/justanr/marshmallow_enum"
SRC_URI="https://github.com/justanr/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/marshmallow-2[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
S="${WORKDIR}/${MY_P}"
