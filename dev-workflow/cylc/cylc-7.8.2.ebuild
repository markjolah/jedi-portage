# Copyright 2019 UCAR
EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="Cylc is a workflow engine for cycling systems."
HOMEPAGE="https://cylc.github.io/"
SRC_URI="https://github.com/cylc/cylc-flow/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+gui +doc test"

RDEPEND="${PYTHON_DEPS}
        dev-python/pyopenssl[${PYTHON_USEDEP}]
        dev-python/requests[${PYTHON_USEDEP}]
        dev-python/urllib3[${PYTHON_USEDEP}]
        gui? ( dev-python/pygtk[${PYTHON_USEDEP}]
               media-gfx/graphviz
               dev-python/pygraphviz[${PYTHON_USEDEP}] )"

DEPEND="${PYTHON_DEPS}
        net-libs/libtirpc
        dev-libs/openssl
        test? ( dev-python/mock[${PYTHON_USEDEP}] )
        doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
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
    use doc && emake
}

src_install() {
    #dodir "/opt/"
    mv "${S}" "${ED%/}/opt/" || die
}
