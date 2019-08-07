# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# inherit toolchain-funcs

DESCRIPTION="A Lua-based environment module system supporting TCL and software hierarchy"
HOMEPAGE="http://www.tacc.utexas.edu/tacc-projects/lmod"
SRC_URI="https://github.com/TACC/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

MY_PN="Lmod"
MY_P="${MY_PN}-${PV}"

DEPEND="dev-lua/luaposix
        >=dev-lua/luafilesystem-1.6.2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_configure() {
    local myconf=(
        --prefix="${EPREFIX}/usr/lib"
    )

    # not autotools-based
    ./configure "${myconf[@]}" || die
}

pkg_postinst() {
    elog "You should add the following to your ~/.bashrc to use Lmod:"
    elog "[ -f /usr/lib/lmod/lmod/init/bash ] && \\ "
    elog "  source /usr/lib/lmod/lmod/init/bash"
}
