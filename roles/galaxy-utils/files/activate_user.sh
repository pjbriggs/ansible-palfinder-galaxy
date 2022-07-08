#!/bin/bash

# Activate a user account

GALAXY_DB=$1
GALAXY_USER=$2
export PGPASSWORD=$3
USER_TO_ACTIVATE=$4

psql -d $GALAXY_DB -U $GALAXY_USER 1>/dev/null 2>&1 <<EOF
--
UPDATE galaxy_user
   SET active = TRUE
WHERE email = '$USER_TO_ACTIVATE' AND active = FALSE;
EOF
