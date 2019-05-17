# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python interface for a minimal init system for Linux containers"
HOMEPAGE="https://github.com/Yelp/dumb-init"
SRC_URI="https://github.com/Yelp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
