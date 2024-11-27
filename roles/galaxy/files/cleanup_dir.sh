#!/bin/bash

USAGE="$(basename $0) DIR INTERVAL [MINDEPTH:1]"

# Directory to clean up
DIR=$1
if [ -z "$DIR" ] ; then
    echo "usage: $USAGE"
    echo "ERROR: no directory specified" >&2
    exit 1
elif [ ! -d "$DIR" ] ; then
    echo "ERROR: $DIR is not a directory" >&2
    exit 1
fi

# Number of days after which files can be removed
INTERVAL=$2
if [ -z "$INTERVAL" ] ; then
    echo "usage: $USAGE"
    echo "ERROR: time interval (days) not specified" >&2
    exit 1
fi

# Minimum number of subdir levels (default: 1)
MINDEPTH=$3
if [ -z "$MINDEPTH" ] ; then
    # Default: process all files except the starting points
    MINDEPTH=1
fi

# Remove regular files
find "${DIR}" -mindepth ${MINDEPTH} -type f -mtime +${INTERVAL} -exec rm -rf {} \;

# Remove links
find "${DIR}" -mindepth ${MINDEPTH} -type l -mtime +${INTERVAL} -exec rm -rf {} \;

# Remove empty directories
find "${DIR}" -mindepth ${MINDEPTH} -type d -mtime +${INTERVAL} -empty -exec rmdir {} \;

