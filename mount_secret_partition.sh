#!/bin/bash
# Script to mount the secret partition

partition_location=/dev/mapper/mysecretpartition
mountpoint=/home/harry/Safe/

if [[ $EUID -ne 0 ]]; then
	echo "You need to be root to run this script";
	exit 1;
fi

mount $partition_location $mountpoint;
