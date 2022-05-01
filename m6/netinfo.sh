#!/bin/bash
mem="1g"
tmpdir="/tmp"
usage="$0 [-m] [-t] [-h]
-m mem (default 1g)
-t tmpdir (default /tmp)
-h show this help menu"
while getopts "m:t:h" flag; do
case "$flag" in
m) mem=$OPTARG ;;
t) tmpdir=$OPTARG ;;
h) echo "$usage" ; exit 0 ;;
?) echo "$usage" ; exit 1 ;;
esac
done
