#!/bin/bash
# Given a query string, it will return the matching query on youtube, based on most viewed

XML_FILE=/tmp/youtube_query.xml

if [[ $# -ne 1 ]]; then
	echo "You must enter ONE query string"
	exit 1
fi

QUERY_URL=`echo "http://gdata.youtube.com/feeds/api/videos?q=$1" | sed 's/ /%20/g'` 

wget -O $XML_FILE $QUERY_URL 

# This removes the xml namespace to be valid input to xmlstarlet
sed -i -e "s/xmlns=[^ ]*//g" $XML_FILE

TEMP_LINK=`xmlstarlet sel -t -m //entry[1] -v id $XML_FILE`

VIDEO_ID=`echo $TEMP_LINK | sed 's%http://gdata.youtube.com/feeds/api/videos/%%g'`

VIDEO_URL="http://www.youtube.com/watch?v=$VIDEO_IDi&hd=1"

echo $VIDEO_URL

#sed -i -e "s/xmlns[^>]*//g" query


