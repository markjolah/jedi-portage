EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="A JOSE implementation in Python."
HOMEPAGE="https://python-jose.readthedocs.io/en/latest/"
SRC_URI="https://github.com/mpdavis/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="pycrypto pycryptodome"
REQUIRED_USE="?? ( pycrypto pycryptodome )"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pyasn1
        dev-python/six
        dev-python/ecdsa
        dev-python/rsa
        dev-python/cryptography
        pycrypto? ( dev-python/pycrypto )
        pycryptodome? ( dev-python/pycryptodome )
        "

