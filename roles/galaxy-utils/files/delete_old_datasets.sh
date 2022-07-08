#!/bin/bash

# Flag all 'old' datasets in the Galaxy database as deleted
#
# Usage: delete_old_datasets.sh GALAXY_DB GALAXY_DB_USER DB_PASSWD [ INTERVAL ]
#
# Example: delete_old_datasets.sh galaxy_db galaxy MyPass "28 days"
#
# What it does:
#
# This script looks for history dataset associations (HDAs) which are
# older than the specified time interval (measured from the creation time
# of the HDA) and which have not already been marked as 'deleted', and
# which don't belong to the 'admin' user.
# Each matching HDA is then marked as 'deleted'.
#
# Once the HDAs have been checked, the script looks for datasets which
# haven't already been deleted, but where the HDA is marked as deleted
# (and where there are no undeleted library dataset associations i.e.
# LDDAs).
# Each matching dataset is then also marked as 'deleted'.
#
# Subsequently running the delete_datasets.sh/purge_datasets.sh scripts
# from Galaxy should be sufficient to remove any associated data files
# from disk (see https://galaxyproject.org/admin/config/performance/purge-histories-and-datasets/)

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
/* Flag HDAs which are older than the cutoff as deleted */
UPDATE history_dataset_association SET deleted = TRUE WHERE create_time < (NOW() - INTERVAL '$INTERVAL') AND deleted = FALSE AND history_id IN (SELECT history.id FROM history JOIN galaxy_user ON history.user_id = galaxy_user.id WHERE username != 'admin');
/* Flag datasets with no HDAs or LDDAs as deleted */
UPDATE dataset SET deleted = TRUE where deleted != TRUE AND id IN (SELECT hda.dataset_id FROM history_dataset_association AS hda WHERE hda.deleted = TRUE) AND id NOT IN (SELECT ldda.dataset_id FROM library_dataset_dataset_association as ldda WHERE ldda.deleted = FALSE);
EOF

echo "# Finished $(date 2>&1)"
