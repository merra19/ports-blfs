#!/bin/sh

pkg_preinst() {
    getent group sshd || groupadd -g 50 sshd  
    getent passwd sshd || useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /bin/false -u 50 sshd
}

pkg_preremove() {
    rc-update del sshd
}

case $1 in
    preinst) pkg_preinst ;;
    preremove) pkg_preremove ;;
esac