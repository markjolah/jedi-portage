# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

MYP=${PN}4-${PV}

DESCRIPTION="C++ library for netCDF"
HOMEPAGE="https://www.unidata.ucar.edu/software/netcdf/"
SRC_URI="https://github.com/Unidata/netcdf-cxx4/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="UCAR-Unidata"
SLOT="0/1"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="examples static-libs hdf5"

RDEPEND=">=sci-libs/netcdf-4.7:=[hdf5]"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MYP}"

src_configure() {
    NETCDF_INCLUDE_DIR=$(nc-config --includedir)
    export CPPFLAGS="-I$NETCDF_INCLUDE_DIR"
    if use hdf5; then
        export CPPFLAGS="-I${EPREFIX}/usr/include/hdf5 $CPPFLAGS"
    fi
    econf $(use_enable static-libs static) \
        --includedir=$EPREFIX/usr/include/netcdf
}

src_install() {
    default
    use examples && dodoc -r examples
    find "${D}" -name '*.la' -delete || die
    find "${D}" -name 'libh5bzip2.so' -delete || die #Provided by sci-libs/netcdf
}
