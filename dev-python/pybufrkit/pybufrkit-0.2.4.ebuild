# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

# MY_PN="bagit-python"
# MY_P="$MY_PN-$PV"

DESCRIPTION="Pure Python toolkit to work with WMO BUFR messages"
HOMEPAGE="https://pybufrkit.readthedocs.io/en/latest/"
SRC_URI="https://github.com/ywangd/${PN}/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="test"

RDEPEND=">=dev-python/bitstring-3.1.3[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        test? ( dev-python/pytest )
       "
