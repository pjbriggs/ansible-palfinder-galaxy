#!/bin/sh
#
# This file is sourced to set up the environment when Galaxy runs jobs
# on the cluster
#
GALAXY_HOME=/mnt/rvmi/centaurus/galaxy
#
# TEMP should be the same as new_file_path
export TEMP=$GALAXY_HOME/tmp
export TMP=$TEMP
export TMPDIR=$TEMP
#
# 12/09/2019: Set locale to be UTF-8 in order to get
# custom QIIME2 conda install to work
# This reverses a previous version where the locale
# was explicity set to be ASCII rather than UTF-8
# so it's possible that it could cause problems
# elsewhere
#export LANG=en_GB.ISO-88591-5
export LANG=en_GB.utf8
export LC_ALL=en_GB.utf8
#
# Explicitly set the locale for sorting etc
export LC_COLLATE=C
#
# Add legacy executables by setting to a non-empty value
export __CENTAURUS_LEGACY_APPS=
if [ ! -z "$__CENTAURUS_LEGACY_APPS" ] ; then
    # SAM tools
    export PATH=$GALAXY_HOME/apps/samtools/0.1.18:$PATH
    # UCSC tools v309/v345
    export PATH=$GALAXY_HOME/apps/ucsc-tools/v345:$PATH
fi
##
#
