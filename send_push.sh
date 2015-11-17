#!/bin/bash

param=${1}
API_KEY=${param%:*}
DEV_IDEN=${param#*:}

if [ $DEV_IDEN == $API_KEY ]; then
  DEV_CMD=""
else
  DEV_CMD="-d device_iden=$DEV_IDEN "
fi

curl https://api.pushbullet.com/api/pushes \
      -u ${API_KEY}: \
      ${DEV_CMD} \
      -d type=note \
      -X POST \
      -d title="SibTorg: ${2}" \
      -d body="${3}"
