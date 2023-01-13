#!/bin/bash

DL_URL="https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4"

##############
##############
##############

RANDOM=$$

wget -q --random-wait $DL_URL -O $RANDOM.mp4

FILENAME=$(echo $(ls *.mp4))

echo "$FILENAME"

UL_URL=$(curl -s -X GET https://upstream.to/api/upload/server?key=47374lfd0yjehhjieip3k | jq -r '.result')

FILECODE=$(curl -s -X POST -F 'key=47374lfd0yjehhjieip3k' -F 'file=@"$FILENAME"' "$UL_URL" | awk '{print $8}' | cut -b 10- | tr -d '":,')

echo "https://upstream.to/$FILECODE"
