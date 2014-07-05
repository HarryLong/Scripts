#!/bin/bash
# Checks data in 'location' for appearing new youtube links. If new link appears, it will open a chrome browser with this link, wait for it to load into tmp, then run the flashToMp3 script to extract the audio

location="/home/harry/Documents/youtube.links"
youtubeURL="http://www.youtube.com/watch?"

if(test -s $location)
 then
  i=`head -n 1 $location`
  sed -i 1d $location
  google-chrome $youtubeURL$i
#  count=0
#  for i in `cat $location`
#   do
#    links[$count]=$i
#    sed '/$1/d' $location
#    count=`expr $count + 1`
#   done
else
echo "File is empty"
fi
