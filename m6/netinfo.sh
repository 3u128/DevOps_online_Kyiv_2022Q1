#!/bin/bash

# source: https://tldp.org/LDP/abs/html/testbranch.html#EX30
# most part solved by Advanced Bash-Scripting Guide - Mendel Cooper

if [[ "$#" -gt 0 ]]; then
	case "$1" in
		--all) 
			hostname -i
			ip addr | grep -i inet;;
		--target)
			ss -t -a;;
		--help)
			echo "usage: netinfo [--all][--help]

--all displays the IP addresses and symbolic names of all hosts in the current subnet
--target displays a list of open system TCP ports";;
	esac
else
	echo "print netinfo --help"
fi
