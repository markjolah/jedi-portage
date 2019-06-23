# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="OpenAPI Spec validator"
HOMEPAGE="https://github.com/p1c2u/openapi-spec-validator"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="icu test"

RDEPEND="
    <dev-python/jsonschema-3
    >=dev-python/pyyaml-3.13
    dev-python/six
    $(python_gen_cond_dep 'dev-python/pathlib3[${PYTHON_USEDEP}]' 'python2*')"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        test? ( dev-python/mock )
       "

python_test() {
    "${EPYTHON}" -m unittest discover -v
}
