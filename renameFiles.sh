#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: renameFiles <from> <to>"
  exit 1
fi

from=$1
to=$2

for f in $(ls *${from}*); do
  newFileName=`echo $f | sed s/${from}/${to}/g` 
  mv $f $newFileName 
done
