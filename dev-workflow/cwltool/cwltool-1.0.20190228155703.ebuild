# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python2_7 python3_{5,6,7} pypy{,3} )

inherit distutils-r1

DESCRIPTION="Common Workflow Language reference implementation"
HOMEPAGE="https://github.com/common-workflow-language/cwltool"
SRC_URI="https://github.com/common-workflow-language/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
         dev-python/ruamel-yaml[${PYTHON_USEDEP}]
         dev-python/rdflib[${PYTHON_USEDEP}]
         dev-python/shellescape[${PYTHON_USEDEP}]
         dev-python/schema-salad[${PYTHON_USEDEP}]
         dev-python/mypy_extensions[${PYTHON_USEDEP}]
         dev-python/six[${PYTHON_USEDEP}]
         dev-python/psutil[${PYTHON_USEDEP}]
         dev-python/scandir[${PYTHON_USEDEP}]
         =dev-python/prov-1.5.1[${PYTHON_USEDEP}]
         dev-python/bagit[${PYTHON_USEDEP}]
         dev-python/typing-extensions[${PYTHON_USEDEP}]
        "
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
