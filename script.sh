#!/bin/bash

DLURL="#https://vdownload-43.sb-cd.com/1/2/12919052-720p.mp4?secure=xaxM6WuFfoDdDuGWkN3KSA,1673634409&m=43&d=1&_tid=12919052"

###############################

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"
DATENOW=$(date +'%Y.%m.%d')
RANDOM=$$

wget --progress=dot:mega --random-wait $DLURL -O video.mp4

mkdir -p temp
cp -p video.mp4 temp/$DATENOW.$RANDOM.mp4
cd temp
VIDFILE=$(ls *.mp4)

UPLOADURL=$(curl -s -X GET "https://api.streamlare.com/api/file/upload/generate?login=$APILOGIN&key=$APIKEY" | jq -r '.result')

HASHID=$(curl -s -k -F file=@$VIDFILE -F login=$APILOGIN -F key=$APIKEY $UPLOADURL | jq -r '.result.hashid')

VIDIMG=$(curl -s -X GET "https://api.streamlare.com/api/file/poster/get?login=$APILOGIN&key=$APIKEY&file=$HASHID" | jq -r '.result')

echo "
VIDEO LINK:
https://streamlare.com/v/$HASHID

SCREENSHOT LINK:
https://cdn.streamlare.com/$VIDIMG"
