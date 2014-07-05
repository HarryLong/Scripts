#!/bin/bash
# Script to convert flv videos into mp3's

#musicFile=/home/harry/Music/nature/
musicFile=/home/harry/passport/Music/sleep/


if [ $# -eq 0 ]
then
 delay=50
else
 delay=$1
fi

#xdg-screensaver activate
mplayer -shuffle $musicFile/*&
sudo shutdown -h +$delay&
xset dpms force off&

