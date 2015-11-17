#!/bin/bash

to=$1
subject="$2"
body="$3"

sendsms $to  "$subject"

