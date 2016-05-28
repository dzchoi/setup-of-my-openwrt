#!/bin/sh
# `nc $1 $2` but wake it up if necessary

if [ $# -ne 2 ]; then exit; fi

# wake up for only ips staticaly leased
if host=`grep "$1" /tmp/hosts/dhcp` && ip=${host%% *}; then
    grep $ip /proc/net/arp | {
	read -r _ _ _ mac _
	if [ -n $mac ]; then
	    arping -f -q -c 1 -I br-lan $ip || etherwake -i br-lan $mac
	    arping -f -q -w 30 -I br-lan $ip	# wait for ping reply for 30s
	fi
    }
fi

exec nc "$@"
