#!/bin/bash

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

NEBULIZER=$(dirname $0)/nebulizer

function user_exists() {
    $NEBULIZER -k $APIKEY list_users $URL --name "$USER" | grep ^$USER | cut -f1
}

function wait_for_galaxy() {
    local galaxy_ready=
    local n_tries=0
    while [ -z "$galaxy_ready" ] ; do
	$NEBULIZER ping $URL -c 1 2>&1 >/dev/null
	if [ $? -ne 0 ] ; then
	    ((ntries++))
	    if [ $ntries -gt 18 ] ; then
		echo Failed to contact $URL >&2
		exit 1
	    fi
	    sleep 5
	else
	    galaxy_ready=yes
	fi
    done
}

# Wait for Galaxy
wait_for_galaxy
echo Galaxy ready at $URL

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
$NEBULIZER -k $APIKEY create_user $URL -p $PASSWD $USER
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
