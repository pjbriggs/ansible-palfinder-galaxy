#!/bin/sh

# Flag all 'old' datasets in the Galaxy database as deleted

echo "# $(basename $0)"
echo "# Started $(date 2>&1)"

GALAXY_DB=$1
GALAXY_USER=$2
export PGPASSWORD=$3
INTERVAL=$4

if [ -z "$INTERVAL" ] ; then
    INTERVAL="30 days"
fi

psql -d $GALAXY_DB -U $GALAXY_USER 2>&1 <<EOF
--
UPDATE history_dataset_association SET deleted = TRUE WHERE create_time < (NOW() - INTERVAL '$INTERVAL') AND deleted = FALSE AND history_id IN (SELECT history.id FROM history JOIN galaxy_user ON history.user_id = galaxy_user.id WHERE username != 'admin');
EOF

echo "# Finished $(date 2>&1)"
