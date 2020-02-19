# Copyright 2019 UCAR
EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="Cylc is a workflow engine for cycling systems."
HOMEPAGE="https://cylc.github.io/"
SRC_URI="https://github.com/cylc/cylc-flow/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
        dev-python/pyopenssl[${PYTHON_USEDEP}]
        dev-python/requests[${PYTHON_USEDEP}]
        dev-python/urllib3[${PYTHON_USEDEP}]"

DEPEND="${PYTHON_DEPS}
        net-libs/libtirpc
        dev-libs/openssl
        "

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

MY_PN="cylc-flow"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${P}"

src_unpack() {
    unpack ${A}
    mv "${WORKDIR}/${MY_P}" "${S}"
}

src_compile() {
    PATH="${S}/bin:$PATH"
}

src_install() {
    dodir opt/
    mv "${S}" "${ED%/}/opt/" || die
}
