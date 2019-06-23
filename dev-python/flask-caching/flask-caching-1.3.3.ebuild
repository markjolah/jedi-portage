# Copyright 2019 JCSDA
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Continuation of the Flask-Cache Extension."
HOMEPAGE="https://flask-caching.readthedocs.io/en/latest/"
SRC_URI="https://github.com/sh4nks/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"

RDEPEND=">=dev-python/flask-0.10[${PYTHON_USEDEP}]
         >=dev-python/werkzeug[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
