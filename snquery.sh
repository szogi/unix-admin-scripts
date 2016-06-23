#!/bin/bash

# DNS serial number querier by szogi@2010-04-06	<dev@localnet.hu>

if [ $# -lt 2 ]; then
	echo "Usage: $0 zone dnsserver"
else
	D=`dig +short +nocomments -t soa $1. @$2`
	if [ $? -ne 0 ]; then
		echo "Error in query!"
	else
	echo -n "Zone: $1 DNS: $2 "
 	echo $D | awk '{ print "S/N: " $3 }'
	fi
fi
