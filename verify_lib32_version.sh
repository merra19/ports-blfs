#!/bin/bash

getportpath() {
	for repo in $PORT_REPO; do
		if [ -f "$repo/$1/spkgbuild" ]; then
			dirname "$repo/$1/spkgbuild"
			return 0
		fi
	done
	return 1
}


clear

ports="$PWD"

pushd $ports/lib32 > /dev/null
listtmp="$(ls)"
lists="$(echo $listtmp | sed 's/-32//g')"
popd  > /dev/null

PORT_REPO="$ports/base $ports/gen-libs $ports/gfx-comp $ports/gfx-fonts 
        $ports/gfx-libs $ports/gnome-desk $ports/media-libs $ports/media-uti 
        $ports/net-libs $ports/net-uti $ports/other $ports/print
        $ports/sec $ports/server $ports/sys-uti"

for packagex in $lists; do

    # First verify spkgbuild exist in 32-bit and 64-bit folder
    if [ ! -f "$ports/lib32/${packagex}-32/spkgbuild" ];then
        echo "missing: $packagex-32"
        continue
    fi

    if [ ! -f "$(getportpath $packagex)/spkgbuild" ];then
        echo "missing: $packagex"
        continue
    fi

    unset ver1 rel1 ver2 rel2
    source $ports/lib32/${packagex}-32/spkgbuild
    ver1="$version"
    rel1="$release"

    source $(getportpath $packagex)/spkgbuild
    ver2="$version"
    rel2="$release"

    if [ $ver1 !=  $ver2 ] ;then
        msg="$name $ver1   $ver2"
        if [ "$rel1" !=  "$rel2" ] ;then
            msg="$msg $rel1 $rel2 "
        fi
        echo $msg
    fi

done
