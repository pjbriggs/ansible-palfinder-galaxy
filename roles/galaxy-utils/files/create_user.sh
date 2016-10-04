#!/bin/sh

# Create user using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 USER PASSWD APIKEY \[URL\]
    exit
fi

USER=$1
PASSWD=$2
APIKEY=$3
if [ ! -z "$4" ] ; then
    URL=$4
else
    URL=http://localhost:80
fi

MANAGE_USERS=$(dirname $0)/manage_users

function user_exists() {
    $MANAGE_USERS list $URL -k $APIKEY --name "$USER" | grep ^$USER | cut -f1
}

# Check for user
if [ -n "$(user_exists)" ] ; then
    echo $USER: already present
    exit
fi

# Check password length
if [ "$(echo $PASSWD | wc -c)" -le 6 ] ; then
    echo Password too short >&2
    exit 1
fi

# Create the user
$MANAGE_USERS create $URL -k $APIKEY -p $PASSWD $USER
if [ $? -ne 0 ] ; then
    echo Failed to create user $USER >&2
    exit 1
fi

# Check that user exists
ntries=0
while [ $ntries -lt 10 ] ; do
    if [ -n "$(user_exists)" ] ; then
	echo $USER: created
	exit
    fi
    ntries=$((ntries+1))
    sleep 5
done
echo Failed to create user $USER >&2
exit 1
