#!/bin/bash

MAIL_SERVER=smtp.yandex.ru
MAIL_PORT=465
MAIL_DATE=`date +"%d %b %Y %T"`
MAIL_FROM=<mail_from>
MAIL_PASSWORD=<password>

MAIL_TO=$1
MAIL_SUBJECT=$2
MAIL_TEXT=$3

MAIL_MESSAGE="Date: ${MAIL_DATE}
\nFrom: ${MAIL_FROM}
\nTo: ${MAIL_TO}
\nSubject: ${MAIL_SUBJECT}
\nContent-Type: text/plain; charset=UTF-8
\n\n${MAIL_TEXT}"

echo -e ${MAIL_MESSAGE} | /usr/bin/msmtp --host=${MAIL_SERVER} --port=${MAIL_PORT} --tls=on --tls-certcheck=off --tls-starttls=off --auth=login --user=${MAIL_FROM} --passwordeval="echo ${MAIL_PASSWORD}" -f ${MAIL_FROM} ${MAIL_TO} 
