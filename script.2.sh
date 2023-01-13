#!/bin/bash

HASHID=""

APILOGIN="4fnvjnFdY1Z18hZL"
APIKEY="qn9BJx6KvciyhG7d"

VIDIMG=$(curl -s -X GET "https://api.streamlare.com/api/file/poster/get?login=$APILOGIN&key=$APIKEY&file=$HASHID" | jq -r '.result')

echo "SCREENSHOT LINK:
https://cdn.streamlare.com/$VIDIMG"
