#!/bin/bash

# Set the default quota for registered users

GALAXY_DB=$1
GALAXY_USER=$2
export PGPASSWORD=$3
QUOTA_GB=$4

if [ -z "$QUOTA_GB" ] ; then
    # Quota is specifed in gigabytes
    QUOTA_GB="5"
fi

quota_bytes=$(($QUOTA_GB * 1024 * 1024 * 1024))

psql -d $GALAXY_DB -U $GALAXY_USER 1>/dev/null 2>&1 <<EOF
--
INSERT INTO quota
   (id,create_time,update_time,name,description,bytes,operation,deleted)
   SELECT 1,NOW(),NOW(),'Default','Default quota',$quota_bytes,'=',FALSE
WHERE
   NOT EXISTS (
      SELECT id FROM quota WHERE id = 1
   );
UPDATE quota
   SET update_time = NOW(), bytes = $quota_bytes
WHERE id = 1;
INSERT INTO default_quota_association
   (id,create_time,update_time,type,quota_id)
   SELECT 1,NOW(),NOW(),'registered',1
WHERE
   NOT EXISTS (
      SELECT id FROM default_quota_association WHERE id = 1
   );
EOF
