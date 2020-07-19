# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Pure Python toolkit to work with WMO BUFR messages"
HOMEPAGE="https://pybufrkit.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-python/bitstring-3.1.3[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
PATCHES=( "${FILESDIR}/${P}-no-pytest-runner.patch" )
