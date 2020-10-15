# Copyright 2020 UCAR

EAPI=7

PYTHON_COMPAT=( python3_{5..8} )

inherit distutils-r1 flag-o-matic

DESCRIPTION="pykdtree is a kd-tree implementation for fast nearest neighbour search in Python"
HOMEPAGE="https://github.com/storpipfugl/pykdtree"
SRC_URI="https://github.com/storpipfugl/pykdtree/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

