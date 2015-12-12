# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils gnome2

DESCRIPTION="A GTK+ viewer for OpenStreetMap files"
HOMEPAGE="http://nzjrs.github.com/osm-gps-map/"
SRC_URI="https://github.com/nzjrs/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+introspection"

REQUIRED_USE="introspection"

RDEPEND="
	>=dev-libs/glib-2.16.0:2
	>=net-libs/libsoup-2.4.0:2.4
	>=x11-libs/cairo-1.8.0
	>=x11-libs/gtk+-3.0:3[introspection]
	dev-libs/gobject-introspection"

DEPEND="${RDEPEND}
	dev-util/gtk-doc-am
	gnome-base/gnome-common:3
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-docs-location.patch"
	eautoreconf

	gnome2_src_prepare
}

src_configure() {
	# Configure script does not accept quoted EPREFIX...
	gnome2_src_configure \
		--docdir=/usr/share/doc/${PF} \
		--enable-fast-install \
		--disable-static
}
