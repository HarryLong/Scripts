#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: addSufix <suffix>"
  exit 1
fi

suffix=$1

for f in $(ls *); do
  newFileName=${suffix}${f} 
  mv "$f" "$newFileName" 
done
