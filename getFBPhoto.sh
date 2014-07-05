#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: getFBPhoto <small|normal|large> <user id>"
fi

wget -O ${2}.${1}.jpg graph.facebook.com/${2}/picture?type=${1}
