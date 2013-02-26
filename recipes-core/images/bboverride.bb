DESCRIPTION = "A small-ish image that starts with busybox, but then adds as many of the 'real' programs as possible"

IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL} \
	trace-cmd bash util-linux coreutils vim openssh procps grep iputils gzip bzip2 sed \
	tar net-tools gawk findutils ncurses tzdata less bc wget psmisc file"

IMAGE_LINGUAS = " "

LICENSE = "MIT"

inherit core-image

ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
