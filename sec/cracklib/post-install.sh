#!/bin/sh

pkg_postinst() {
    create-cracklib-dict  /usr/share/dict/cracklib-words &>/dev/null
}

case $1 in
    postinst) pkg_postinst ;;
esac