# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1 git-r3

DESCRIPTION="python interface to NCEP BUFR library"
HOMEPAGE="https://github.com/JCSDA/py-ncepbufr"
EGIT_REPO_URI="https://github.com/JCSDA/py-ncepbufr"
EGIT_BRANCH="master"
EGIT_COMMIT="c91201fa3f64184b31aeb5d1e3c3fabcb4fb5305"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND=" dev-python/setuptools[${PYTHON_USEDEP}]
	 sci-libs/ncep-bufrlib "

PATCHES=( "${FILESDIR}/${P}-ncep-burfrlib.patch" )

python_configure_all() {
    export bufrlib_ROOT="/usr"
}
