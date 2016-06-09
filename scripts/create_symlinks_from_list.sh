#!/bin/bash
 
# This simple script creates a symlink to all comma separated targets in the
# target directory
DIR=/etc/puppetlabs/code/environments 
LIST=$1
 
if ! [[ -d $DIR ]]; then
  echo "$DIR is not a valid directory. Aborting"
  exit 1
fi

cd $DIR
for TARGET in $(echo $LIST | tr "," "\n"); do
  ln -s "${TARGET}"
done
exit 0
