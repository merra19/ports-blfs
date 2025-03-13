#!/bin/sh

pkg_preinst() {
    getent group seat || groupadd -fg 202 seat 
}

case $1 in
    preinst) pkg_preinst ;;
esac