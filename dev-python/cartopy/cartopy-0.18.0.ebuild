# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1 flag-o-matic

DESCRIPTION="Cartopy - a cartographic python library with matplotlib support"
HOMEPAGE="https://pypi.org/project/Cartopy/"
SRC_URI="https://github.com/SciTools/${PN}/archive/v${PV}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
    >=sci-libs/Shapely-1.5.6[${PYTHON_USEDEP}]
    >=sci-libs/pyshp-1.1.4[${PYTHON_USEDEP}]
    >=dev-python/six-1.3.0[${PYTHON_USEDEP}]
    >=dev-python/matplotlib-1.5.1[${PYTHON_USEDEP}]
    "

DEPEND="sci-libs/proj
        sci-libs/gdal
	sci-libs/geos
        ${RDEPEND}"

python_prepare_all() {
    append-flags -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H
    distutils-r1_python_prepare_all
}
