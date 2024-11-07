#!/bin/bash

USAGE="$(basename $0) BACKUP_DIR MAX_BACKUPS"

# Backup directory
BACKUPS_DIR=$1
if [ -z "$BACKUPS_DIR" ] || [ ! -d "$BACKUPS_DIR" ] ; then
    echo "usage: $USAGE"
    echo "ERROR: no backup directory specified" >&2
    exit 1
fi

# Maximum number of backups to keep
MAX_BACKUPS=$2
if [ -z "$MAX_BACKUPS" ] ; then
    echo "usage: $USAGE"
    echo "ERROR: maximum number of backups not specified" >&2
    exit 1
fi

# Compress SQL dumps of database
find "${BACKUPS_DIR}" -name "*.sql" -exec gzip {} \;

# Keep most recent database dumps
while [ $(ls -1 ${BACKUPS_DIR} | grep '.sql.gz$' | wc -l) -gt ${MAX_BACKUPS} ] ; do
    /bin/rm -f "$(ls -t -1 ${BACKUPS_DIR}/*.sql.gz | tail -n 1)"
done
