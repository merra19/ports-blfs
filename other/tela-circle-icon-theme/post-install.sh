#!/bin/sh

pkg_preremove() {
	rm -f /usr/share/icons/Tela-circle*/icon-theme.cache
}

case $1 in
    preremove) pkg_preremove ;;
esac