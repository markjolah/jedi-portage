# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils
DESCRIPTION="C++ Guidelines Support Library for C++98, C++11 and up"
HOMEPAGE="https://github.com/gsl-lite/gsl-lite"
SRC_URI="https://github.com/gsl-lite/gsl-lite/archive/v$PV.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
