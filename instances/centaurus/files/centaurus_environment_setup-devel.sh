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
# Set locale to ASCII rather than UTF-8
export LANG=en_GB.ISO-88591-5
#
# SAM tools
##export PATH=$GALAXY_HOME/apps/samtools/1.2/bin:$PATH
export PATH=$GALAXY_HOME/apps/samtools/1.3.1/bin:$PATH
#
# Bowtie (for trinityrnaseq)
export PATH=$PATH:/opt/gridware/pkg/apps/bowtie/1.1.0/gcc-4.4.7
#
# Fake usearch for Amplicon analysis pipeline testing
##if [ -d $GALAXY_HOME/devel/local_tools/Amplicon_analysis/tool_dependencies/_mock_usearch ] ; then
##    echo Adding fake usearch executables to PATH
##    export PATH=$PATH:$GALAXY_HOME/devel/local_tools/Amplicon_analysis/tool_dependencies/_mock_usearch
##fi
##
#
