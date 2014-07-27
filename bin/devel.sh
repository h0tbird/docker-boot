#!/bin/bash

#--------------------------
# Sparse modules checkout:
#--------------------------

PUPPETFILE=puppet/environments/production/Puppetfile \
PUPPETFILE_DIR=devel/modules \
r10k puppetfile install

#-------------------------
# Checkout master branch:
#-------------------------

for i in `dirname devel/modules/*/manifests`; do
  pushd $i && git checkout master; popd
done &> /dev/null

#-------------------------
# Soft link to hieradata:
#-------------------------

ln -s ../puppet/hieradata devel
