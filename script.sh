#!/bin/bash

DLURL="https://vdownload-43.sb-cd.com/1/2/12919052-720p.mp4?secure=xaxM6WuFfoDdDuGWkN3KSA,1673634409&m=43&d=1&_tid=12919052"

###############################

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"
DATENOW=$(date +'%Y.%m.%d')
RANDOM=$$

wget -q --random-wait $(curl -sLo $DLURL) -O video.mp4

mkdir -p temp
cp -p video.mp4 temp/$DATENOW.$RANDOM.mp4
cd temp
LSMAIN=$(ls *.mp4)
FILEMP4=$(echo "$LSMAIN")

UPLOADURL=$(curl -s -X GET "https://api.streamlare.com/api/file/upload/generate?login=$APILOGIN&key=$APIKEY" | jq -r '.result')

HASHID=$(curl -k -F file=@$FILEMP4 -F login=$APILOGIN -F key=$APIKEY $UPLOADURL | jq -r '.result.hashid')

echo "https://streamlare.com/$HASHID"
