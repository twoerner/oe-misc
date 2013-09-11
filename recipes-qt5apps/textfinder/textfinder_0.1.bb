# Copyright (C) 2013 Trevor Woerner <twoerner@gmail.com>

DESCRIPTION = "Qt5 test application build"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=376e6986d1fb1aa798d1389c3ed19c35"
SECTION = "qt5app"
DEPENDS = "qtbase"

S = "${WORKDIR}/git"
SRCREV = "${AUTOREV}"
PR = "r0"
SRC_URI = "git://github.com/twoerner/textfinder.git"

inherit qmake5
OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/build/textfinder ${D}${bindir}
}
