# Copyright 2020 UCAR
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools fortran-2

DESCRIPTION="GPTL is a library to instrument C, C++, and Fortran codes for performance analysis and profiling."
HOMEPAGE="https://jmrosinski.github.io/GPTL/"
SRC_URI="https://github.com/jmrosinski/GPTL/releases/download/v${PV}/${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
KEYWORDS="amd64"
SLOT="0"

IUSE="+pmpi papi"

DEPEND="virtual/mpi
        papi? ( dev-libs/papi )"

pkg_setup() {
    fortran-2_pkg_setup
}

src_configure() {
  export CC=mpicc
  export FC=mpif90
  econf \
    $(use_enable papi) \
    $(use_enable pmpi) \
    --includedir=$EPREFIX/usr/include/gptl
}
