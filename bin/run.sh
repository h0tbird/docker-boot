#!/bin/bash

SUDO=`which sudo`; if [[ $EUID -ne 0 ]]; then $SUDO $0 $@; else
  NAME='boot'
  docker run --privileged -d --name $NAME h0tbird/boot
  pipework br0 $NAME 192.168.2.10/24
fi
