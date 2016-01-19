# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4} )

DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1

DESCRIPTION="Genealogical Research and Analysis Management Programming System"
HOMEPAGE="http://www.gramps.org/"
SRC_URI="https://github.com/gramps-project/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+reports +exif spell geography"

DEPEND="${PYTHON_DEPS}"
RDEPEND=">x11-libs/gtk+-3.14.8
	>=dev-python/pygobject-3.12:3[${PYTHON_USEDEP}]
	x11-libs/pango[introspection]
	x11-libs/cairo
	gnome-base/librsvg:2
	x11-misc/xdg-utils
	dev-python/bsddb3[${PYTHON_USEDEP}]
	reports? ( media-gfx/graphviz )
	spell? ( dev-python/gtkspell-python
	         app-text/gtkspell[introspection] )
	exif? ( >=media-libs/gexiv2-0.5[${PYTHON_USEDEP},introspection] )
	geography? ( >=sci-geosciences/osm-gps-map-1.0 )"

DOCS="RELEASE_NOTES FAQ AUTHORS TODO NEWS README"

src_prepare() {
	epatch "${FILESDIR}/${P}-resourcepath.patch"
	distutils-r1_src_prepare
}
