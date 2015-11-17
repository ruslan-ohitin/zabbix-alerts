#!/bin/bash

# sms_modem.sh - Zabbix alert script for sending text sms using smstools3 package
#
# Ruslan Ohitin 2015
# ruslan.ohitin@gmail.com
# https://github.com/ruslan-ohitin/zabbix-alerts

# you need sendsms script somethere in your path

to=$1
subject="$2"
body="$3"

sendsms $to  "$subject"

