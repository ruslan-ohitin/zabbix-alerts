#!/bin/bash

# Send sms by sms.ru

API_ID="api_id"
FROM="79000000000"

TO=$1
SUBJECT="Str: $2"
BODY="$3"

curl -d "text=$SUBJECT" http://sms.ru/sms/send\?api_id=${API_ID}\&from=${FROM}\&to=${TO}

