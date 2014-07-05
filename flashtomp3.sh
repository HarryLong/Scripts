#!/bin/bash
# Script to convert flv videos into mp3's

[[ $# -ne 4 ]] && echo "Need to pass a flash input file as 1st argument, output directory as second argument, artist name as third argument and the song name as the fourth argument." && exit 1

[[ ! -f $1 ]] && echo "File $1 does not exist. Exitting..." && exit 1

[[ ! -d "$2" ]] && echo "`dirname "$2"` is not a valid directory. Exitting..." && exit 1

artist=$3
song=$4

output_file="$2/$4.mp3"

echo "written to $output_file"

ffmpeg -i $1 -metadata artist="$artist" -metadata title="$song" -ab 312000 "$output_file" > /home/harry/Scripts/logs/flashtomp3
