#!/bin/sh

pkg_postinst() {
    kernver=$(find /lib/modules -maxdepth 1 -type d -iname '*-LFS' -printf "%f\n")
    
    cd /boot
    mkinitramfs $kernver
    depmod $kernver

    # run all dkms scripts
    if [ $(command -v dkms) ]; then
        for i in /var/lib/dkms/buildmodules-*.sh; do
            sh $i
        done
    fi
}

pkg_postupgrade() {
    pkg_postinst
}

pkg_preremove() {
    version="$(grep "linux-arch" .pkgfiles | awk -F- '{print $3}')"
    (
        cd /usr/lib/modules/$version-LFS/
        for i in /usr/lib/modules/$version-LFS/* ;do
            case $i in
                modules.order | modules.buildtin*) ;;
                modules.*) rm -f $i ;;
                *) ;;
            esac
        done
    )
}


case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    preremove) pkg_preremove ;;
esac