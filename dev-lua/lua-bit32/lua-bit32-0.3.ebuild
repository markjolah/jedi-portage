# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Based on bit32 ebuild from lua overlay

EAPI="7"

inherit toolchain-funcs

DESCRIPTION="A Lua5.2+ bit manipulation library"
HOMEPAGE="https://github.com/keplerproject/lua-compat-5.2"
SRC_URI="https://github.com/keplerproject/lua-compat-5.2/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
READMES=( README.md )

DEPENDS="dev-lang/lua:0="
LICENSE="MIT"
SLOT="0"
IUSE=""

LIB_PN="bit32"

S="${WORKDIR}/lua-compat-5.2-${PV}"

src_compile() {
    local MY_PN="lbitlib"
    $(tc-getCC) ${CFLAGS} -fPIC -Ic-api -c -o ${MY_PN}.o ${MY_PN}.c || die
    $(tc-getCC) ${LDFLAGS} -shared -fPIC -llua -o ${LIB_PN}.so ${MY_PN}.o || die
}

src_install() {
    insinto /usr/lib64/lua/5.1
    doins "${LIB_PN}.so"
}
