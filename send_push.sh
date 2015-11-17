#!/bin/bash

# send_push.sh - Zabbix alert script for sending pushes using pushbullet.com service
#
# First parameter should be API_KEY or API_KEY:DEV_IDEN
# See https://docs.pushbullet.com/ for docs.
#
# Ruslan Ohitin 2015
# ruslan.ohitin@gmail.com
# https://github.com/ruslan-ohitin/zabbix-alerts

TITLE_PREFIX="Prefix: " # Use this to customize pushes from different servers

param=${1}
API_KEY=${param%:*}
DEV_IDEN=${param#*:}

if [ $DEV_IDEN == $API_KEY ]; then
  DEV_CMD=""
else
  DEV_CMD="-d device_iden=$DEV_IDEN "
fi

TITLE=$2
BODY=$3

curl https://api.pushbullet.com/api/pushes \
      -u ${API_KEY}: \
      ${DEV_CMD} \
      -d type=note \
      -X POST \
      -d title="${TITLE_PREFIX}${TITLE}" \
      -d body="${BODY}"

