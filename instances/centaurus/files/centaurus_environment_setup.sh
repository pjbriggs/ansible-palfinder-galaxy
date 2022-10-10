#!/bin/sh
#
# This file is sourced to set up the environment when Galaxy runs jobs
# on the cluster
#
GALAXY_HOME=/mnt/rvmi/centaurus/galaxy
#
# Proxies
export HTTPS_PROXY=proxy.man.ac.uk:3128
export https_proxy=$HTTPS_PROXY
export HTTP_PROXY=$HTTPS_PROXY
export https_proxy=$HTTPS_PROXY
export FTP_PROXY=$HTTPS_PROXY
export ftp_proxy=$HTTPS_PROXY
#
# TEMP should be the same as new_file_path
export TEMP=$GALAXY_HOME/tmp
export TMP=$TEMP
export TMPDIR=$TEMP
#
# Set locale to be UTF-8
export LANG=en_GB.utf8
export LC_ALL=en_GB.utf8
#
# Explicitly set the locale for sorting etc
export LC_COLLATE=C
