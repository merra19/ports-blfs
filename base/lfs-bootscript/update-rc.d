#!/bin/sh
#
# update-rc.d	Update the links in /etc/rc[0-9S].d/
#
# (c) 2003, 2004 Phil Blundell <pb@handhelds.org>
#
# SPDX-License-Identifier: GPL-2.0-or-later
#

initd="/etc/init.d"
etcd="/etc/rc"
notreally=0
force=0
dostart=0
verbose=0

usage()
{
	cat >&2 <<EOF
usage: update-rc.d [-n] [-f] [-r <root>] <basename> remove
       update-rc.d [-n] [-r <root>] [-s] <basename> defaults [NN | sNN kNN]
       update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [runlvl] [...] .
       update-rc.d [-n] [-r <root>] [-s] <basename> enable|disable [S|2|3|4|5]
		-n: not really
		-f: force
		-v: verbose
		-r: alternate root path (default is /)
		-s: invoke start methods if appropriate to current runlevel
EOF
}

checklinks()
{
	local i dn fn remove=0
	if [ "x$1" = "xremove" ]; then
		echo " Removing any system startup links for $bn ..."
		remove=1
	fi

	for i in 0 1 2 3 4 5 6 7 8 9 S; do
		dn="${etcd}${i}.d"
		if [ ! -d $dn ]; then
			continue;
		fi
		for f in ${dn}/[SK]??${bn}; do
			if [ -L $f ]; then
				if [ $remove -eq 0 ]; then
					return 1
				fi
				echo "  $f"
				if [ $notreally -eq 1 ]; then
					continue
				fi
				rm $f
			fi
		done
	done

	return 0
}

dolink()
{
	startstop=$1
	lev=`echo $2 | cut -d/ -f1`
	nn=`echo $2 | cut -d/ -f2`
	fn="${etcd}${lev}.d/${startstop}${nn}${bn}"
	[ $verbose -eq 1 ] && echo "  $fn -> ../init.d/$bn"
	if [ $notreally -eq 0 ]; then
		mkdir -p `dirname $fn`
 		ln -s ../init.d/$bn $fn
	fi
	if [ $dostart -eq 1 ] && [ $startstop = "S" ] && [ $lev = $RUNLEVEL ]; then
		$fn start || true
	fi
}

makelinks()
{
	if ! checklinks; then
		echo " System startup links for $initd/$bn already exist."
		if [ $dostart -eq 1 ] && [ $notreally -eq 0 ] && [ -L ${etcd}${RUNLEVEL}.d/S??${bn} ]; then
			${etcd}${RUNLEVEL}.d/S??${bn} restart || true
		fi
		exit 0
	fi

	echo " Adding system startup for $initd/$bn."

	for i in $startlinks; do
		dolink S $i
	done
	for i in $stoplinks; do
		dolink K $i
	done
}

# function to disable/enable init script link of one run level
# $1 should be K/S, means to disable/enable
# $2 means which run level to disable/enable 
renamelink()
{
	local oldstartstop newstartstop lev oldnn newnn
	if [ "x$1" = "xS" ]; then
		oldstartstop="K"
		newstartstop="S"
	else
		oldstartstop="S"
		newstartstop="K"
	fi

	lev=$2
	# modifies existing runlevel links for the script /etc/init.d/name by renaming start links to stop link
        # or stop link to start link with a sequence number equal to the difference of 100 minus the original sequence number.
	if ls ${etcd}${lev}.d/${oldstartstop}*${bn} >/dev/null 2>&1; then
		oldnn=`basename ${etcd}${lev}.d/${oldstartstop}*${bn}|cut -c2-3`
		newnn=$(printf "%02d" $((100-${oldnn#0})))
		[ $verbose -eq 1 ] && echo "rename ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} -> ${etcd}${lev}.d/${newstartstop}${newnn}${bn}"
		if [ $notreally -eq 0 ];then
			mv ${etcd}${lev}.d/${oldstartstop}${oldnn}${bn} ${etcd}${lev}.d/${newstartstop}${newnn}${bn}
		fi
		if [ $dostart -eq 1 ] && [ $newstartstop = "S" ] && [ $lev = $RUNLEVEL ]; then
			$fn start || true
		fi
	fi

}

# function to disable/enable init script link
# $1 should be K/S, means to disable/enable
# $2 run level [S|2|3|4|5], optional, If no start runlevel is 
# specified after the disable or enable keywords 
# the script will attempt to modify links in all start runlevels
renamelinks()
{
	if [ $# -eq 2 ]; then
		renamelink $1 $2
	else
		for i in 2 3 4 5 S; do
			renamelink $1 $i
		done
	fi
}

while [ $# -gt 0 ]; do
	case $1 in
		-n)	notreally=1
			shift
			continue
			;;
		-v)	verbose=1
			shift
			continue
			;;
		-f)	force=1
			shift
			continue
			;;
		-s)	dostart=1
			shift
			continue
			;;
		-r)     shift
			root=$1
			initd="${root}${initd}"
			etcd="${root}${etcd}"
			shift
			;;
		-h | --help)
			usage
			exit 0
			;;
		-*)
			usage
			exit 1
			;;
		*)
			break
			;;
	esac
done

if [ $# -lt 2 ]; then
	usage
	exit 1
fi

bn=$1
shift

sn=$initd/$bn
if [ -L "$sn" -a -n "$root" ]; then
	if which readlink >/dev/null; then
		while true; do
			linksn="$(readlink "$sn")"
			if [ -z "$linksn" ]; then
				break
			fi

			sn="$linksn"
			case "$sn" in
				/*) sn="$root$sn" ;;
				*)  sn="$initd/$sn" ;;
			esac
		done
	else
		echo "update-rc.d: readlink tool not present, cannot check whether \
				$sn symlink points to a valid file." >&2
	fi
fi

if [ $1 != "remove" ]; then
	if [ ! -f "$sn" ]; then
		echo "update-rc.d: $initd/$bn: file does not exist" >&2
		exit 1
	fi
else
	if [ -f "$sn" ]; then
		if [ $force -eq 1 ]; then
			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)" >&2
		else
			echo "update-rc.d: $initd/$bn exists during rc.d purge (use -f to force)" >&2
			exit 1
		fi
	fi
fi

if [ $dostart -eq 1 ]; then
	#RUNLEVEL=`sed 's/.*\[\(.*\)\]/\1/' < /proc/1/cmdline`
	RUNLEVEL=`runlevel | cut -d" " -f2`
	if [ "x$RUNLEVEL" = "x" ]; then
		echo "Unable to determine current runlevel" >&2
		exit 1
	fi
fi

case $1 in
	remove)
		checklinks "remove"
		;;

	defaults)
		if [ $# -gt 3 ]; then
			echo "defaults takes only one or two arguments" >&2
			usage
			exit 1
		fi
		start=20
		stop=20
		if [ $# -gt 1 ]; then
			start=$2
			stop=$2
		fi
		if [ $# -gt 2 ]; then
			stop=$3
		fi
		start=`printf %02d $start`
		stop=`printf %02d $stop`
		stoplinks="0/$stop 1/$stop 6/$stop"
		startlinks="2/$start 3/$start 4/$start 5/$start"
		makelinks
		;;

	start | stop)
		if [ $# -lt 4 ]
		then
			echo "Not enough arguments"
			usage
			exit 1
		fi

		while [ $# -gt 0 ]; do
			if [ $1 = "start" ]; then
				letter=S
			elif [ $1 = "stop" ]; then
				letter=K
			else
				echo "expected start or stop" >&2
				usage
				exit 1
			fi
			shift
			NN=`printf %02d $(expr $1 + 0)`
			shift
			while [ "x$1" != "x." ]; do
				if [ $# -eq 0 ]; then
					echo "action with list of runlevels not terminated by \`.'" >&2
					exit 1
				fi
				level=$1
				shift
				case $letter in
					S) startlinks="$startlinks $level/$NN" ;;
					K) stoplinks="$stoplinks $level/$NN" ;;
				esac
			done
			shift
		done
		makelinks
		;;

	enable | disable)
		if [ $1 = "enable" ]; then
			letter=S
		elif [ $1 = "disable" ]; then
			letter=K
		else
			usage
			exit 1
		fi
		shift
		# 
		if [ $# -gt 0 ]
		then
			case $1 in
				S|2|3|4|5)
					renamelinks $letter $1
					;;
				*)
					usage
					exit 1
					;;
			esac
		else
			renamelinks $letter
		fi
		;;
	*)
		usage
		exit 1
		;;
esac