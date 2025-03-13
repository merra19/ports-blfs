#!/bin/sh

pkg_postinst() {
    install -vdm755 /etc/alsa/conf.d
    ln -sfvr /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
}

case $1 in
    postinst) pkg_postinst ;;
esac