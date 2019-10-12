# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} pypy{,3} )

inherit distutils-r1

DESCRIPTION="Fast, pure-Python full text indexing, search and spell checking library"
HOMEPAGE="https://bitbucket.org/mchaput/whoosh/wiki/Home/ https://pypi.org/project/Whoosh/"
SRC_URI="mirror://pypi/W/${PN^}/${P^}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sparc x86 ~amd64-fbsd ~x64-solaris"
IUSE="doc"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx )"
	#test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${P^}"

PATCHES=(
	#"${FILESDIR}"/${PN}-2.7.4-tests-specify-utf8.patch
)

python_prepare_all() {
	sed -e "/^              'sphinx.ext.intersphinx',/d" -i docs/source/conf.py || die
	local -x PYTHONPATH=
	distutils-r1_python_prepare_all
}

python_configure_all() {
	local -x PYTHONPATH=
	PYTHONPATH="" distutils-r1_python_configure_all
}

python_compile_all() {
	local -x PYTHONPATH=
	PYTHONPATH="" distutils-r1_python_compile_all
}

