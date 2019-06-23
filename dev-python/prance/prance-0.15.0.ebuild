# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Resolving Swagger/OpenAPI 2.0 and 3.0 Parser"
HOMEPAGE="https://jfinkhaeuser.github.io/prance"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="icu test"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        icu? ( dev-python/pyicu )
        test? ( dev-python/mock )
       "

python_prepare_all() {
    #Fix version in setup.py
    sed -i -e"s:use_scm_version=True:version=\"${PV}\":" setup.py || die
    #Fix /usr/locale -> /usr/share/locale
    sed -i -e"s:import sys:import sys\nimport re:" setup.py || die
    sed -i -e"s:(os.path.dirname(mo_file):(re.sub(\"locale\",\"share/locale\",os.path.dirname(mo_file)):" setup.py || die
    distutils-r1_python_prepare_all
}

python_test() {
    "${EPYTHON}" -m unittest discover -v
}
