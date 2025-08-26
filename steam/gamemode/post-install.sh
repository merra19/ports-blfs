#!/bin/sh

pkg_postinst() {
    printf "\e[1;32m %s \e[0m\n" " sudo  gpasswd -a <username> gamemode "
}


case $1 in
    postinst) pkg_postinst ;;
esac