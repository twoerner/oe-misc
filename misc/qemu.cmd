$ runqemu qemux86 tmp/deploy/images/trevor-image-qemux86.ext3 

Continuing with the following parameters:
KERNEL: [/home/trevor/devel/yocto/git-method/trevor/tmp/deploy/images/bzImage-qemux86.bin]
ROOTFS: [tmp/deploy/images/trevor-image-qemux86.ext3]
FSTYPE: [ext3]
Setting up tap interface under sudo
root's password:
Acquiring lockfile for tap0...
WARNING: distccd not present, no distcc support loaded.
Running qemu-system-i386...
/home/trevor/devel/yocto/git-method/trevor/tmp/sysroots/x86_64-linux/usr/bin/qemu-system-i386 \
	-kernel /home/trevor/devel/yocto/git-method/trevor/tmp/deploy/images/bzImage-qemux86.bin \
	-net nic,vlan=0 \
	-net tap,vlan=0,ifname=tap0,script=no,downscript=no \
	-hda tmp/deploy/images/trevor-image-qemux86.ext3 \
	-show-cursor \
	-usb \
	-usbdevice wacom-tablet \
	-vga vmware \
	-no-reboot \
	-m 128 \
	--append "vga=0 root=/dev/hda rw mem=128M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 "
