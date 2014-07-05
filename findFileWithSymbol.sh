#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: findFileWithSymbol <symbol>"
  exit 1
fi

symbol=$1

echo "Searching for symbol ${symbol} in `pwd`"

for f in $(ls *.so); do
  symbols=`readelf -Ws ${f} | grep -i ${symbol}` 
  if [[ -n ${symbols} ]] ; then
    echo "Symbol ${symbol} found in file: ${f}"
#    echo ${symbols}
#    echo "************************************"
  fi
done
