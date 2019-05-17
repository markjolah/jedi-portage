# Copyright 2019 JCSDA
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python2_7 python3_{5,6,7} pypy )

inherit distutils-r1

MY_PN="Flask-AppBuilder"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Simple and rapid application development framework, built on top of Flask"
HOMEPAGE="https://flask-appbuilder.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
    >=dev-python/apispec-1.1.1[yaml ${PYTHON_USEDEP}]
    >=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
    >=dev-python/click-6.7[${PYTHON_USEDEP}]
    >=dev-python/flask-0.12[${PYTHON_USEDEP}]
    >=dev-python/flask-babel-0.11.1[${PYTHON_USEDEP}]
    >=dev-python/flask-login-0.3[${PYTHON_USEDEP}]
    >=dev-python/flask-openid-1.2.5[${PYTHON_USEDEP}]
    >=dev-python/flask-sqlalchemy-2.4[${PYTHON_USEDEP}]
    >=dev-python/flask-wtf-0.14.2[${PYTHON_USEDEP}]
    >=dev-python/flask-jwt-extended-3.18[${PYTHON_USEDEP}]
    >=dev-python/jsonschema-3.0.1[${PYTHON_USEDEP}]
    <dev-python/marshmallow-2.20.0[${PYTHON_USEDEP}]
    >=dev-python/marshmallow-enum-1.4.1[${PYTHON_USEDEP}]
    >=dev-python/marshmallow-sqlalchemy-0.16.1[${PYTHON_USEDEP}]
    >=dev-python/dateutil-2.3[${PYTHON_USEDEP}]
    >=dev-python/prison-0.1.0[${PYTHON_USEDEP}]
    >=dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
    "

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"
