# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="The httplib2 caching algorithms packaged up for use with requests"
HOMEPAGE="https://github.com/ionrock/cachecontrol https://pypi.org/project/cachecontrol/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

RDEPEND="
    dev-python/requests[${PYTHON_USEDEP}]
    >=dev-python/lockfile-0.9[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
    dev-python/setuptools[${PYTHON_USEDEP}]
    "
