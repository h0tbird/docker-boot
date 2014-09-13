#!/bin/bash

SUDO=`which sudo`; if [[ $EUID -ne 0 ]]; then $SUDO $0 $@; else

  ROLE='boot'
  DOMAIN='demo.lan'

  LIST=`docker ps -a | awk '/'$ROLE'[0-9]/ {print $NF}'`
  for ID in `seq -w 99`; do echo $LIST | grep -q $ID || break; done

  HNAME=${ROLE}${ID}.${DOMAIN}
  CNAME=${ROLE}${ID}

  CID=$(docker run --privileged -d -h $HNAME --name $CNAME h0tbird/boot)
  pipework br0 $CNAME 192.168.2.10/24

fi
