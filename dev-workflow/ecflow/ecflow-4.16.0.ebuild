# Copyright UCAR 2019
EAPI=7

PYTHON_COMPAT=( python3_{5,6,7} )

inherit python-single-r1 cmake-utils flag-o-matic

MY_PN="ecFlow"
MY_P="${MY_PN}-${PV}"

BOOST_PV="1.53.0"
BOOST_MY_PV="1_53_0"
BOOST_MY_P="boost_${BOOST_MY_PV}"
BOOST_P="boost-${BOOST_PV}"

DESCRIPTION="ecFlow is a work flow package that enables users to run a large number of programs in a controlled environment."
HOMEPAGE="https://confluence.ecmwf.int/display/ECFLOW/ecflow+home"
SRC_URI="https://confluence.ecmwf.int/download/attachments/8650755/${MY_P}-Source.tar.gz?api=v2 -> ${P}.tar.gz
         https://sourceforge.net/projects/boost/files/boost/${BOOST_PV}/boost_${BOOST_MY_PV}.tar.gz/download -> ${BOOST_P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ui +gui +server -ssl"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
        ssl? ( dev-libs/openssl )
        net-libs/libtirpc
        dev-vcs/git
        ui? ( dev-qt/qtcore
               dev-qt/qtwidgets
               dev-qt/qtgui
               dev-qt/qtnetwork
               dev-qt/qtsvg
               dev-qt/qtcharts )
        gui? (  x11-libs/libX11
                x11-libs/motif )
        dev-lang/perl"
RDEPEND="${PYTHON_DEPS}"

S="${WORKDIR}/${MY_P}-Source"

PATCHES=(
    "${FILESDIR}/${P}-gnuinstalldirs.patch"
    "${FILESDIR}/${P}-libxec.patch"
    "${FILESDIR}/${P}-menuy.patch"
)
BUILD_DIR="${WORKDIR}/${P}-build"
src_prepare() {
    mkdir -p "${BUILD_DIR}" || die
    echo "PYTHON: ${PYTHON}"
    echo "BUILD_DIR: ${BUILD_DIR}"
    ln -sf "${WORKDIR}/${BOOST_MY_P}" "${BUILD_DIR}/boost" || die
    sed -e "s:-j2:${MAKEOPTS}:g" \
        -e "s:-Wno-deprecated-declarations:-Wno-deprecated-declarations -Wno-parentheses:g" \
        -i "${S}/build_scripts/boost_build.sh" || die
    cmake-utils_src_prepare
}

src_configure() {
    cd "${BUILD_DIR}/boost" && \
        ./bootstrap.sh --with-python=${PYTHON}  --with-python-root=${PYTHON} || die
    python_get_includedir
    sed -e "s@${PYTHON}@${PYTHON} : ${PYTHON_INCLUDEDIR}@" \
        -i "${BUILD_DIR}/boost/project-config.jam" || die
    WK="${BUILD_DIR}" 
    BOOST_ROOT="${BUILD_DIR}/boost"
    "${S}/build_scripts/boost_build.sh" || die
    append-cxxflags -Wno-deprecated-declarations
    append-flags "-isystem ${EROOT%/}/usr/include/tirpc"
    local mycmakeargs=(
        -DPython3_FIND_STRATEGY="LOCATION"
        -DPYTHON_EXECUTABLE="${PYTHON}"
        -DENABLE_SERVER="$(usex server)"
        -DENABLE_UI="$(usex ui)"
        -DENABLE_GUI="$(usex gui)"
        -DENABLE_SSL="$(usex ssl)"
        -DBOOST_ROOT="${BOOST_ROOT}"
    )
    CMAKE_BUILD_TYPE="Release"
    cmake-utils_src_configure
}

