# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils fortran-2 toolchain-funcs flag-o-matic

MY_PN=${PN}-ng
MY_P=${MY_PN}-${PV}

DESCRIPTION="Arnoldi package library to solve large scale eigenvalue problems"
HOMEPAGE="https://github.com/opencollab/arpack-ng"
SRC_URI="https://github.com/opencollab/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc examples mpi static"
RESTRICT="primaryuri"
RDEPEND="
	virtual/blas
	virtual/lapack
	mpi? ( virtual/mpi[fortran] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	if $(use mpi); then
		export CC=mpicc
		export FC=mpifort
	fi
	export FFLAGS="${FFLAGS} $(test-flags-F77 -fallow-argument-mismatch)"
	econf   $(use_enable static) \
		--with-blas="$($(tc-getPKG_CONFIG) --libs blas)" \
		--with-lapack="$($(tc-getPKG_CONFIG) --libs lapack)" \
		$(use_enable mpi)
}

src_install() {
	default

	dodoc DOCUMENTS/*.doc
	newdoc DOCUMENTS/README README.doc
	use doc && dodoc "${WORKDIR}"/*.ps
	if use examples; then
		insinto ${EPREFIX}/usr/share/doc/${PF}
		doins -r EXAMPLES
		if use mpi; then
			insinto ${EPREFIX}/usr/share/doc/${PF}/EXAMPLES/PARPACK
			doins -r PARPACK/EXAMPLES/MPI
		fi
	fi
}
