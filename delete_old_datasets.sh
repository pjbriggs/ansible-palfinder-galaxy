#!/bin/sh

# Flag all 'old' datasets in the Galaxy database as deleted

GALAXY_DB=$1
GALAXY_USER=$2
export PGPASSWORD=$3
INTERVAL=$4

if [ -z "$INTERVAL" ] ; then
    INTERVAL="30 days"
fi

psql -d $GALAXY_DB -U $GALAXY_USER 1>/dev/null 2>&1 <<EOF
--
UPDATE history_dataset_association SET deleted = TRUE WHERE create_time < (NOW() - INTERVAL '$INTERVAL') AND deleted = FALSE;
EOF

