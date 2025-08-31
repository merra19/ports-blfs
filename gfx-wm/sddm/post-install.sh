#!/bin/sh

pkg_preinst() {
    getent group sddm || groupadd -g 64 sddm
    getent passwd sddm || useradd  -c "sddm Daemon" -d /var/lib/sddm -u 64 -g sddm -s /bin/false sddm
}

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-sddm
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-sddm
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac