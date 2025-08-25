#!/bin/sh

pkg_postinst() {
    fc-cache -v > /dev/null

    printf "\e[1;32m %s \e[0m\n" " sudo usermod -a -G netdev <username>"
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_postremove() {
    pkg_postinst
}

case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    postremove) pkg_postremove ;;
esac
