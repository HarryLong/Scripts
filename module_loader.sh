#!/bin/sh
# Script to convert flv videos into mp3's

cryptsetup="cryptsetup";
free_device=`losetup -f`;


echo $free_device;

