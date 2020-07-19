# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PV="$(ver_cut 1-3).jcsda$(ver_cut 4)"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Python interface to odc for encoding/decoding ODB files"
HOMEPAGE="https://github.com/JCSDA/pyodc"
SRC_URI="https://github.com/ecmwf/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
# SRC_URI="https://github.com/JCSDA/${PN}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/cffi[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

# S="${WORKDIR}/${P}"

PATCHES=( "${FILESDIR}/pyodc-1.0.2-no-pytest-runner.patch" )
