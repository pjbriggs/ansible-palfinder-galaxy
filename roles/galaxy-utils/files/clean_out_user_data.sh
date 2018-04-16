#!/bin/sh

# Clean out histories for specified user in the Galaxy database
#
# Usage: clean_out_user_data.sh GALAXY_DB GALAXY_DB_USER DB_PASSWD EMAIL
#
# Example: clean_out_user_data.sh galaxy_db galaxy MyPass "j.bloggs@example.com"
#
# What it does:
#
# This script sets the user ID to NULL for all histories currently owned
# by the user specified by the supplied email. It also sets the current
# history in all sessions for that user to NULL.
#
# When the user account is next accessed all previous histories will no
# longer be accessible.
#
# Subsequently running the delete_userless_histories.sh and other clean
# up scripts from Galaxy should be sufficient to garbage collect the
# associated data files (see https://galaxyproject.org/admin/config/performance/purge-histories-and-datasets/)

if [ $# -lt 4 ] ; then
    echo "Usage: $(basename $0) GALAXY_DB GALAXY_DB_USER DB_PASSWD EMAIL"
    exit
fi

echo "# $(basename $0)"
echo "# Started $(date 2>&1)"

GALAXY_DB=$1
GALAXY_USER=$2
export PGPASSWORD=$3
USER_EMAIL=$4

echo "Cleaning out histories for $USER_EMAIL"

psql -d $GALAXY_DB -U $GALAXY_USER 2>&1 <<EOF
--
/* Unpublish histories */
UPDATE history SET published = False WHERE user_id IN (SELECT id FROM galaxy_user WHERE email LIKE '$USER_EMAIL');
/* Unshare histories */
DELETE FROM history_user_share_association WHERE history_id IN (SELECT id FROM history WHERE user_id IN (SELECT id FROM galaxy_user WHERE email LIKE '$USER_EMAIL'));
/* Reset current history in all sessions */
UPDATE galaxy_session SET current_history_id = NULL WHERE user_id in (SELECT id FROM galaxy_user WHERE email LIKE '$USER_EMAIL');
/* Disassociate all histories from the user */
UPDATE history SET user_id = NULL WHERE user_id IN (SELECT id FROM galaxy_user WHERE email LIKE '$USER_EMAIL');
EOF

echo "# Finished $(date 2>&1)"

