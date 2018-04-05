#!/bin/bash

DEVICE=/dev/ttyUSB0
BAUDRATE=115200
IN_FILE=$1
OUT_FILE=$2
USERNAME=username
PASSWORD=password

awk 'BEGIN{doprint=0;} { if(doprint==1) { print $0; }; } /^# EOEEOEEOE$/{doprint=1;}' "${BASH_SOURCE}" | \
	base64 -d - | expect -f - -- $DEVICE $BAUDRATE $IN_FILE $OUT_FILE $USERNAME $PASSWORD

exit $?

# !!! DO NOT REMOVE THE FOLLOWING LINE !!!
# EOEEOEEOE
