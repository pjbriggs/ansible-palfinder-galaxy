#!/bin/sh

# Create user using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 USER PASSWD APIKEY
    exit
fi

USER=$1
PASSWD=$2
APIKEY=$3

MANAGE_USERS=.venv/bin/manage_users
URL=http://localhost:80

function user_exists() {
    $MANAGE_USERS list $URL -k $APIKEY --name "$USER" | grep ^$USER | cut -f1
}

# Check for user
if [ -n $(user_exists) ] ; then
    echo $USER: already present
    exit
fi

# Create the user
$MANAGE_USERS create $URL -k $APIKEY -p $PASSWD $USER

# Check that user exists
ntries=0
while [ $ntries -lt 10 ] ; do
    if [ -n $(user_exists) ] ; then
	echo $USER: created
	exit
    fi
    ntries=$((ntries+1))
    sleep 5
done
echo Failed to create user $USER 2>&1
exit 1
