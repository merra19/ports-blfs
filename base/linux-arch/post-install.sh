#!/bin/sh

name="linux-arch"
export name

pkg_postinst() {
    version="$(awk 'NR==1 {print $1}' /var/lib/scratchpkg/db/$name)"
    
    cd /boot
    mkinitramfs $version-LFS
    depmod $version-LFS

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
    version="$(awk 'NR==1 {print $1}' /var/lib/scratchpkg/db/$name)"
    (
        cd /usr/lib/modules/$version-LFS/
        for i in * ;do
            case $i in
                modules.order | modules.builtin | modules.builtin.modinfo) ;;
                modules.*) rm -f $i ;;
                *) ;;
            esac
        done
    )
    echo "cleaning initramfs"
    rm -fv /boot/initrd.img-$version-LFS
}


case $1 in
    postinst) pkg_postinst ;;
    postupgrade) pkg_postupgrade ;;
    preremove) pkg_preremove ;;
esac