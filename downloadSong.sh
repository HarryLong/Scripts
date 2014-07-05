#!/bin/bash
# Given an artist and song, retrieves the video from youtube and downloads audio from it 

[[ $# -ne 1 ]] && echo "You must enter a song to download" && exit 1;

[[ $1 != *-* ]] && echo "The query syntax must be of the form '<artist name> - <song name>'" && exit 1

artist=`echo $1 | cut -d'-' -f1 `
song=`echo $1 | cut -d'-' -f2`

echo "Fetching video id for $artist $song..."

video_url=`/home/harry/Scripts/getYoutubeUrl.sh "$artist $song"` 

echo "Found video ID."

/home/harry/Scripts/downloadURL.sh "$video_url" "$artist" "$song"
