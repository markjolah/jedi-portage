# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="A decorator for caching properties in classes."
HOMEPAGE="https://github.com/pydanny/cached-property"
SRC_URI="https://github.com/pydanny/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
