# Copyright 2019 JCSDA
# Distributed under the terms of the Apache Liscence 2.0

EAPI=7

PYTHON_COMPAT=(python2_7 python3_{5,6,7} pypy{,3} )

inherit distutils-r1

DESCRIPTION="Airflow is a platform to programmatically author, schedule and monitor workflows."
HOMEPAGE="https://airflow.apache.org/"
SRC_URI="https://github.com/apache/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="<dev-python/alembic-1.0[${PYTHON_USEDEP}]
         >=dev-python/cached-property-1.5.1[${PYTHON_USEDEP}]
         $(python_gen_cond_dep '>=dev-python/configparser-3.5.0[${PYTHON_USEDEP}]' 'python2*')
         >=dev-python/croniter-0.3.17[${PYTHON_USEDEP}]
         >=dev-python/dill-0.2.2[${PYTHON_USEDEP}]
         >=dev-python/dumb-init-1.2.2[${PYTHON_USEDEP}]
         <dev-python/flask-2[${PYTHON_USEDEP}]
         >=dev-python/flask-appbuilder-1.12.5[${PYTHON_USEDEP}]
         <dev-python/flask-caching-1.4.0[${PYTHON_USEDEP}]
         >=dev-python/flask-login-0.3[${PYTHON_USEDEP}]
         
        "
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
