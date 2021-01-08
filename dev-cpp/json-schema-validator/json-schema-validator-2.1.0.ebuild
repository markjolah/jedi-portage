# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils
DESCRIPTION="A C++ library for validating JSON documents based on a JSON Schema"
HOMEPAGE="https://github.com/pboettch/${PN}"
SRC_URI="https://github.com/pboettch/${PN}/archive/$PV.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-cpp/nlohmann_json"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-cmake-libdir.patch" )
