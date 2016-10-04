#!/bin/sh

# Restart Galaxy using Supervisord and uWSGI

# Why this utility exists
# -----------------------
# It should be possible to just do "supervisorctl restart galaxy:"
# and have everything just work.
#
# Unfortunately in some setups if there are multiple uWSGI processes
# then these are left behind, blocking the port that is needed for
# Galaxy.
#
# It's not clear why this happens but this script attempts to work
# around by proactively removing the child uWSGI processes before
# restarting.

# Get the command line
if [ $# -eq 0 ] ; then
    echo Usage: $0 NAME
    exit
fi
NAME="$1"
SUPERVISORCTL=/usr/local/bin/supervisorctl
SIGNAL=QUIT
echo Restarting Galaxy processes: $NAME

SUPERVISOR_PROCESSES=$($SUPERVISORCTL status "${NAME}:*" | grep RUNNING | awk '{print $4}' | cut -d, -f1)
echo Supervisord managed processes:
echo SUPERVISOR_PROCESSES=$SUPERVISOR_PROCESSES

# Fetch the PIDs for the child processes
PROCESSES=
if [ ! -z "$SUPERVISOR_PROCESSES" ] ; then
    for PS in $SUPERVISOR_PROCESSES ; do
	echo Collecting children of PID $PS
	CHILD_PROCESSES=$(ps --no-header --ppid $PS -o pid)
	if [ ! -z "$CHILD_PROCESSES" ] ; then
	    PROCESSES="$PROCESSES $CHILD_PROCESSES"
	fi
	PROCESSES="$PROCESSES $PS"
    done
    echo Stopping using supervisord
    $SUPERVISORCTL stop "${NAME}:*"
    echo Waiting...
    sleep 30
    if [ ! -z "$PROCESSES" ] ; then
	echo Manually removing leftover processes
    	for PS in $PROCESSES ; do
	    if [ ! -z "$(ps --pid $PS)" ] ; then
		echo ...sending SIG$SIGNAL to $PS
		kill -s $SIGNAL $PS
	    else
		echo ...$PS not found
	    fi
	done
	echo Finished removing processes manually
    fi
else
    echo No processes found to remove
fi
echo Current status:
$SUPERVISORCTL status "${NAME}:*"

# Restart
echo Restarting
$SUPERVISORCTL start "${NAME}:*"

# Wait for everything to come back up
ntries=0
while [ $ntries -lt 300 ] ; do
    running=$($SUPERVISORCTL status "${NAME}:*" | grep RUNNING)
    waiting=$($SUPERVISORCTL status "${NAME}:*" | grep "STARTING\|STOPPING\|STOPPED\|BACKOUT")
    failed=$($SUPERVISORCTL status "${NAME}:*" | grep FAILED)
    if [ ! -z "$failed" ] ; then
	echo "!!!One or more processes failed to start!!!"
	exit 1
    elif [ ! -z "$waiting" ] || [ -z "$running" ] ; then
	ntries=$((ntries+1))
	echo "Waiting for processes to start running... ($ntries)"
	sleep 10
    else
	echo Processes restarted:
	$SUPERVISORCTL status "${NAME}:*"
	exit 0
    fi
done
echo "!!!Timed out waiting for restart!!!"
exit 1
##
#
	
    
