#!/bin/sh

pkg_preinst() {
    getent group sshd || groupadd -g 50 sshd  
    getent passwd sshd || useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /bin/false -u 50 sshd
}

pkg_postinst() {
    cd /usr/share/blfs-bootscripts
    make install-sshd
}

pkg_preremove() {
    cd /usr/share/blfs-bootscripts
    make uninstall-sshd
}

case $1 in
    preinst) pkg_preinst ;;
    #postinst) pkg_postinst ;;
    preremove) pkg_preremove ;;
esac