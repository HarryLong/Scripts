#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: changeExtension <from> <to>"
  exit 1
fi

from_extension=$1
to_extension=$2

echo "Changing $from_extension to $to_extension"

for f in $(ls *.${from_extension}); do
  newFileName=`echo $f | sed s/\.${from_extension}/\.${to_extension}/` 
  mv "$f" "$newFileName" 
done
