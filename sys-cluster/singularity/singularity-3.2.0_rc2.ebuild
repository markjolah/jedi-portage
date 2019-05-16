# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit autotools eutils python-single-r1

MY_PV=$(ver_rs 3 '-')
SRC_PV=$(ver_cut 1-3)
MY_P=${PN}-${MY_PV}

DESCRIPTION="Application containers for Linux"
HOMEPAGE="http://singularity.lbl.gov/"
SRC_URI="https://github.com/sylabs/${PN}/releases/download/v${MY_PV}/${PN}-${SRC_PV}.tar.gz"


SLOT="0"
LICENSE="cctbx-2.0"
KEYWORDS=""
IUSE="examples static-libs +suid"

RDEPEND="
	sys-fs/squashfs-tools:0
"
S="${WORKDIR}/${PN}"

# src_prepare() {
# 	default
# 	# automake version hardcoding
# }

src_configure() {
    default
    cd ${S} && ./mconfig
}

src_compile() {
    make -C builddir
}

src_install() {
	MAKEOPTS+=" -j1"
	default
	prune_libtool_files
	dodoc README.md CONTRIBUTORS.md CONTRIBUTING.md
	use examples && dodoc -r examples
}
