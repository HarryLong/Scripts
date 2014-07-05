#!/bin/bash
# Given an artist and song, retrieves the video from youtube and downloads audio from it 

exec > /home/harry/Dropbox/youtube_extractor/log

dropbox_home="/home/harry/Dropbox/youtube_extractor/"

from="${dropbox_home}to_extract"
to="${dropbox_home}extracted"
query=`head -n1 $from`

[[ -z $query ]] && echo "no songs or first line empty..." && exit 1
/home/harry/Scripts/downloadSong.sh "$query" && echo "$query" >> $to && sed -i 1d $from 

	

