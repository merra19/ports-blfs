#!/bin/sh

pkg_postinst() {
    echo "rebuild mingw-w64-gcc after mingw-w64-winpthreads"
    echo "scratch -I -y -f -r mingw-w64-gcc"
    exit 1
}

postupgrade() {
    pkg_postinst
}



case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
esac