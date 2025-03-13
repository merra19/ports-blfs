#!/bin/sh

pkg_postinst() {
    install -v -d -m755 /usr/share/fonts
    ln -svfn /usr/share/fonts/X11/OTF /usr/share/fonts/X11-OTF
    ln -svfn /usr/share/fonts/X11/TTF /usr/share/fonts/X11-TTF
}

case $1 in
    postinst) pkg_postinst ;;
esac