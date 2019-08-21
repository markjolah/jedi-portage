# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Provides syntax for Python-Markdown which allows for the inclusion of the contents of other Markdown documents. "
HOMEPAGE="https://github.com/cmacmackin/markdown-include"
SRC_URI="https://github.com/cmacmackin/markdown-include/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/markdown[${PYTHON_USEDEP}]"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        ${RDEPEND}"
