#!/bin/sh

pkg_preinst() {
    getent group polkitd || groupadd -fg 27 polkitd
    getent passwd polkitd || useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 -g polkitd -s /bin/false polkitd
}

case $1 in
    preinst) pkg_preinst ;;
esac