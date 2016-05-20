#!/bin/sh

# Create and populate data library using nebulizer & Galaxy API

if [ $# -eq 0 ] ; then
    echo Usage: $0 USER PASSWD LIBRARY FILE \[--file_type FILE_TYPE\] \[FILE ...\]
    exit
fi

USER=$1
PASSWD=$2
LIBRARY=$(echo $3 | cut -d/ -f1)
FOLDER=$(echo $3 | cut -d/ -f2-)

MANAGE_LIBRARIES=.venv/bin/manage_libraries
URL=http://localhost:80

# Create data library
got_library=$($MANAGE_LIBRARIES list $URL -u $USER -P $PASSWD 2>/dev/null | grep "^$LIBRARY")
if [ -z "$got_library" ] ; then
    echo "Making library $LIBRARY"
    $MANAGE_LIBRARIES create_library $URL -u $USER -P $PASSWD "$LIBRARY" 2>/dev/null
else
    echo "Library $LIBRARY exists"
fi

# Create subfolder
if [ ! -z "$FOLDER" ] ; then
    got_folder=$($MANAGE_LIBRARIES list $URL -u $USER -P $PASSWD "$LIBRARY" 2>/dev/null | grep "^/$FOLDER")
    if [ -z "$got_folder" ] ; then
	echo "Making folder $FOLDER in $LIBRARY"
	$MANAGE_LIBRARIES create_folder $URL -u $USER -P $PASSWD "$LIBRARY/$FOLDER" 2>/dev/null
    else
	echo "Folder $FOLDER exists under $LIBRARY"
    fi
fi

# Upload each specified file
while [ ! -z "$4" ] ; do
    FILE=$4
    shift
    if [ "$4" == "--file_type" ] ; then
	shift
	FILE_TYPE="--file_type=$4"
	shift
    else
	FILE_TYPE=
    fi
    got_file=$($MANAGE_LIBRARIES list $URL -u $USER -P $PASSWD "$LIBRARY/$FOLDER" 2>/dev/null | grep "^$(basename $FILE)")
    if [ -z "$got_file" ] ; then
	echo "Adding file $FILE to $LIBRARY/$FOLDER"
	if [ ! -z "$(echo $FILE | grep ^http)" ] ; then
	    echo "Downloading $(basename $FILE)"
	    wget -O $(basename $FILE) $FILE
	    FILE=$(basename $FILE)
	fi
	$MANAGE_LIBRARIES add_datasets $URL -u $USER -P $PASSWD --server "$LIBRARY/$FOLDER" $FILE $FILE_TYPE 2>/dev/null
    else
	echo "File $(basename $FILE) exists under $LIBRARY/$FOLDER"
    fi
done
