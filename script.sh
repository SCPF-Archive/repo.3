#!/bin/bash

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"
DATENOW=$(date +'%Y.%m.%d')
RANDOM=$$

wget -nv --random-wait -i assets/url.txt -O video.mp4

mkdir -p temp
cp -p video.mp4 temp/$DATENOW.$RANDOM.mp4
cd temp
LSMAIN=$(ls *.mp4)
VIDFILE=$(echo "$LSMAIN")

UPLOADURL=$(curl -s -X GET "https://api.streamlare.com/api/file/upload/generate?login=$APILOGIN&key=$APIKEY" | jq -r '.result')

HASHID=$(curl -s -k -F file=@$VIDFILE -F login=$APILOGIN -F key=$APIKEY $UPLOADURL | jq -r '.result.hashid')

echo "HASH ID:
$HASHID

VIDEO LINK:
https://sltube.org/v/$HASHID"
