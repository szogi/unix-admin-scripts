#!/bin/bash
#
# (SCSI)Disk serial number querier/logger by szogi@2015-10-12	<dev@localnet.hu> | (thx2 Andras KORN)
# depends: lsscsi, smartmontools, bsdutils, coreutils, sed
# call from rc.local

#query disks' s/n and log it 
lsscsi| sed -f <(for i in /dev/sd?; do smartctl -i $i | sed -rn "/^Serial [nN]umber:/{s@.*:(.*)@s#$i#$i\t\1#@;p}"; done) | tee /var/log/disks | logger
