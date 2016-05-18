TARGETS = console-setup mountkernfs.sh alsa-utils ufw x11-common hostname.sh plymouth-log pppd-dns dns-clean screen-cleanup apparmor udev mountdevsubfs.sh resolvconf procps brltty hwclock.sh checkroot.sh networking urandom checkroot-bootclean.sh bootmisc.sh checkfs.sh mountnfs-bootclean.sh mountnfs.sh mountall.sh mountall-bootclean.sh kmod
INTERACTIVE = console-setup udev checkroot.sh checkfs.sh
udev: mountkernfs.sh
mountdevsubfs.sh: mountkernfs.sh udev
resolvconf: dns-clean
procps: mountkernfs.sh udev
brltty: mountkernfs.sh udev
hwclock.sh: mountdevsubfs.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
networking: mountkernfs.sh urandom resolvconf procps dns-clean
urandom: hwclock.sh
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: checkroot-bootclean.sh udev mountnfs-bootclean.sh mountall-bootclean.sh
checkfs.sh: checkroot.sh
mountnfs-bootclean.sh: mountnfs.sh
mountnfs.sh: networking
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
kmod: checkroot.sh
