# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Compare NetCDF files"
HOMEPAGE="https://gitlab.com/remikz/nccmp"
SRC_URI="https://gitlab.com/remikz/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
    sci-libs/netcdf"

