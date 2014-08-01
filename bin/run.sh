#!/bin/bash

SUDO=`which sudo`; if [[ $EUID -ne 0 ]]; then $SUDO $0 $@; else
  CID=$(docker run --privileged -d h0tbird/dnsmasq)
  pipework br0 $CID 192.168.2.10/24
fi
