# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7,8} )

inherit distutils-r1

DESCRIPTION="Python interface to odc for encoding/decoding ODB files"
HOMEPAGE="https://github.com/ecmwf/pyodc"
SRC_URI="https://github.com/ecmwf/${PN}/archive/${PV}.tar.gz"
RESTRICT="primaryuri"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pytest-runner[${PYTHON_USEDEP}]
        dev-python/cffi[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-setup-fix.patch" )
