#!/bin/bash
# Checks data in 'location' for appearing new youtube links. If new link appears, it will open a chrome browser with this link, wait for it to load into tmp, then run the flashToMp3 script to extract the audio

[[ $# -ne 1 ]] && echo "You must enter a file to monitor" && exit 1;

[[ ! -f $1 ]] && echo "File does not exist" && exit 1; 

 
size=`du -b $1 | awk '{print $1}'`

sleep 60;

size2=`du -b $1 | awk '{print $1}'`

echo $size vs $size2

[[ $size -eq $size2 ]] && echo "File not changing." && exit 1;

echo "File changing..."

exit 0

