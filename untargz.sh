#!/bin/bash
# Simple script to extract .tar.gz files

$extract_from;
$extract_to;

current_path=`pwd`;

if [[ $# -ne 1 && $# -ne 2 ]]; then
        echo "Error: You must pass 1 or 2 arguments";
        exit 1;
fi 

if [[ $# -ge 1 ]]; then
	firstChar=`echo $1 | cut -c-1`;
	if [[ $firstChar = "/" ]]; then
		extract_from=$1;
	else
		extract_from="$current_path/$1";
	fi
fi

filetype=`echo $extract_from | tail -c 8`;
filetype2=`echo $filetype | tail -c 5`;

if [[ $filetype != ".tar.gz" && $filetype2 != ".tgz" ]]; then
	echo "file type must be a compressed tar file (ie .tar.gz)";
	exit 1;
fi


extract_to=`dirname "$extract_from"`;

if [[ $# -eq 2 ]]; then
	firstChar=`echo $2 | cut -c-1`;
	if [[ $firstChar = "/" ]]; then
		extract_to=$2;
	else
		extract_to="$current_path/$2";
	fi	
fi

tar -zxvf "$extract_from" -C "$extract_to" > /dev/null;

