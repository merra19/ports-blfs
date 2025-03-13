#!/bin/sh

pkg_preinst() {
    getent group ntp || groupadd -g 87 ntp 
    getent passwd ntp || useradd -c "Network Time Protocol" -d /var/lib/ntp -u 87 -g ntp -s /bin/false ntp
}

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-ntpd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-ntpd
}

case $1 in
    preinst) pkg_preinst ;;
    postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac