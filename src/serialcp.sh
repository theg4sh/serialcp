#!/bin/bash

DEVICE=/dev/ttyUSB0
BAUDRATE=115200
LOCAL_FILE=$1
REMOTE_FILE=$2
USERNAME=ubuntu
PASSWORD=ubuntu

# 0 - from another machine to current
# 1 - from current machine to another
DIRECTION=${3:-out}

# TODO: Parsing user-friendly arguments
# TODO: Parse first two parameters by '/dev/ttyUSB0:115200:/path/to/file', represent it as DEVICE:BAUDRATE:REMOTE_FILE
#	and set direction automatically

awk 'BEGIN{doprint=0;} { if(doprint==1) { print $0; }; } /^# EOEEOEEOE$/{doprint=1;}' "${BASH_SOURCE}" | \
	base64 -d - | expect -f - -- $DEVICE $BAUDRATE $LOCAL_FILE $REMOTE_FILE $DIRECTION $USERNAME $PASSWORD

if [[ "$DIRECTION" == "in" ]]; then
	sed '1d;$d' "$LOCAL_FILE" | base64 -d -i > "$LOCAL_FILE.gz"
	gzip -f -d "$LOCAL_FILE.gz"
fi

exit $?

# !!! DO NOT REMOVE THE FOLLOWING LINE !!!
# EOEEOEEOE
