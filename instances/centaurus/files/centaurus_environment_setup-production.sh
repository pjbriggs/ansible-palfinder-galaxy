#!/bin/sh
#
# This file is sourced to set up the environment when Galaxy runs jobs
# on the cluster
#
GALAXY_HOME=/mnt/rvmi/centaurus/galaxy
GALAXY_TOP=$HOME/production
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
#export LC_ALL=C
#
# SAM tools
##export PATH=$GALAXY_HOME/apps/samtools/1.2/bin:$PATH
##export PATH=$GALAXY_HOME/apps/samtools/1.3.1/bin:$PATH
export PATH=$GALAXY_HOME/apps/samtools/0.1.18:$PATH
#
# MEME 4.9.1
export PATH=$GALAXY_TOP/apps/meme/4.9.1_2/bin:$PATH
#
# Bowtie for Trinity
export PATH=$PATH:/opt/gridware/pkg/apps/bowtie/1.1.0/gcc-4.4.7
#
# BEDTools
export PATH=$GALAXY_TOP/apps/bedtools/2.22.0:$PATH
#
# R 3.1.1
##export PATH=$GALAXY_TOP/apps/R/3.1.1/bin:$PATH
#
# UCSC tools v309/v345
##export PATH=$GALAXY_TOP/apps/ucsc-tools/v309:$PATH
export PATH=$GALAXY_HOME/apps/ucsc-tools/v345:$PATH
#
# MACS 2.1.0
##01/12/2016[PJB]: Commented out when upgrading to v16.01
##01/12/2016[PJB]: Can we remove .../libs/numpy and .../apps/macs2 later?
##export PYTHONPATH=$GALAXY_TOP/libs/numpy/1.8.0/2.7/lib/python2.7/site-packages:$PYTHONPATH
##export PYTHONPATH=$GALAXY_TOP/apps/macs2/2.1.0.20140616/lib/python2.7/site-packages:$PYTHONPATH
##export PATH=$GALAXY_TOP/apps/macs2/2.1.0.20140616/bin:$PATH
##
#
