#!/bin/sh

pkg_preinst() {
    getent group avahi || groupadd -fg 84 avahi 
    getent passwd avahi || useradd  -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 -g avahi -s /bin/false avahi
}

case $1 in
    preinst) pkg_preinst ;;
esac