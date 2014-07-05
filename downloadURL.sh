#!/bin/bash
# Given a youtube link, downloads the audio 


[[ $# -ne 3 ]] && echo "You must enter 3 arguments: 
				    #1 Link to youtube file you want to download
			            #2 Artist name
				    #3 Song title" && exit 1;


cache_dir="/home/harry/.cache/google-chrome/Default/Cache/"
#download_dir="/home/harry/Music/from_youtube/"
download_dir="/home/harry/Dropbox/youtube_extractor/files"

video_url=$1
artist=$2
song=$3

#first remove all flash videos that exist in cache
find $cache_dir -size +1M | xargs file | grep "Macromedia *" | awk '{print $1}' | sed 's/://' | xargs rm 2> /dev/null 

#Open a new browser with this video
google-chrome $video_url&

$file

echo "Attempting to find flash file..."

while [[ -z $file ]]; do
	sleep 2
	file=`find $cache_dir -size +1M | xargs file | grep "Macromedia *" | awk '{print $1}' | sed 's/://'`	
done 

echo "Found flash file: $file"

while (/home/harry/Scripts/isFileChanging.sh $file); do
	sleep 5
done

echo "File finished downloading, attempting to extract audio..."

/home/harry/Scripts/flashtomp3.sh "$file" "$download_dir" "$artist" "$song"
 












