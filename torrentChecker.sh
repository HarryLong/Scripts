#!/bin/bash
# Script to convert flv videos into mp3's

log=/var/log/torrentChecker.log

copyFrom=/home/harry/Dropbox/torrents/download
copyTo=/home/harry/Torrents
rtorrent=/usr/bin/rtorrent

exec > $log 2>&1

is_file()
{
for f in $copyFrom/*.torrent
  do
  test -f "$f" && return
  done;
return 1;
}


if(is_file);then
  find $copyFrom/*.torrent | xargs -I {} mv "{}" "$copyTo"
  pgrep rtorrent
  if([[ $? -ne 0 ]]);then
   screen -s $rtorrent -d -mi
  fi
fi
