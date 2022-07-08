#!/bin/bash

# Script for (re)starting/stopping Galaxy

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

# Internal variables
export _SUPERVISORCTL=/usr/local/bin/supervisorctl
export _SIGNAL=QUIT

# Functions

function usage() {
    echo "Usage: $(basename $0) [start|stop|restart] GALAXY [--master-api-key API_KEY|--no-master-api-key] [--config GALAXY_YAML] [--user GALAXY_USER]"
}

function galaxy_status() {
    # Report status of Galaxy
    echo Status of Galaxy processes:
    $_SUPERVISORCTL status "${GALAXY}:*"
}

function start_galaxy() {
    # Attempts to start Galaxy
    echo "*** Starting ${GALAXY} ***"
    $_SUPERVISORCTL start "${GALAXY}:*"
    # Wait for everything to come back up
    local ntries=0
    while [ $ntries -lt 300 ] ; do
	local running=$($_SUPERVISORCTL status "${GALAXY}:*" | grep RUNNING)
	local waiting=$($_SUPERVISORCTL status "${GALAXY}:*" | grep "STARTING\|STOPPING\|STOPPED\|BACKOUT")
	local failed=$($_SUPERVISORCTL status "${GALAXY}:*" | grep FAILED)
	if [ ! -z "$failed" ] ; then
	    echo "!!!One or more processes failed to start!!!"
	    return 1
	elif [ ! -z "$waiting" ] || [ -z "$running" ] ; then
	    ntries=$((ntries+1))
	    echo "Waiting for processes to start running... ($ntries)"
	    sleep 10
	else
	    galaxy_status
	    return 0
	fi
    done
    echo "!!!Timed out waiting for restart!!!"
    return 1
}

function stop_galaxy() {
    # Check on status
    local waiting=$($_SUPERVISORCTL status "${GALAXY}:*" | grep "STARTING\|STOPPING\|BACKOUT")
    local ntries=0
    while [ ! -z "$waiting" ] ; do
	if [ $ntries -lt 300 ] ; then
	    ntries=$((ntries+1))
	    sleep 1
	    waiting=$($_SUPERVISORCTL status "${GALAXY}:*" | grep "STARTING\|STOPPING\|BACKOUT")
	else
	    echo "!!!One or more processes stuck 'STARTING' or 'STOPPING!!!"
	    return 1
	fi
    done
    # Attempt to stop Galaxy
    echo "*** Stopping ${GALAXY} ***"
    # Get Galaxy processes from supervisor
    local galaxy_procs=$($_SUPERVISORCTL status "${GALAXY}:*" | grep RUNNING | awk '{print $4}' | cut -d, -f1)
    if [ -z "$galaxy_procs" ] ; then
	echo No running Supervisord-managed Galaxy processes
	galaxy_status
	return 0
    fi
    echo Supervisord-managed Galaxy processes:
    echo $galaxy_procs
    # Add the PIDs for the child processes
    if [ ! -z "$galaxy_procs" ] ; then
	local galaxy_proc=
	local extra_procs=
	for galaxy_proc in $galaxy_procs ; do
	    echo Collecting children of PID $galaxy_proc
	    local children=$(ps --no-header --ppid $galaxy_proc -o pid)
	    if [ ! -z "$children" ] ; then
		extra_procs="$extra_procs $children"
	    fi
	done
	galaxy_procs="$galaxy_procs $extra_procs"
	echo Stopping using supervisord
	$_SUPERVISORCTL stop "${GALAXY}:*"
	echo Waiting...
	sleep 30
	if [ ! -z "$galaxy_procs" ] ; then
	    echo Manually removing leftover processes
    	    for galaxy_proc in $galaxy_procs ; do
		if [ ! -z "$(ps --pid $galaxy_proc)" ] ; then
		    echo ...sending SIG$_SIGNAL to $galaxy_proc
		    kill -s $_SIGNAL $galaxy_proc
		else
		    echo ...$galaxy_proc not found
		fi
	    done
	    echo Finished removing processes manually
	fi
    else
	echo No processes found to remove
    fi
    # Report status of processes
    galaxy_status
    return 0
}

function update_master_api_key() {
    # Update the master API key in the Galaxy config
    echo "*** Updating the master API key ***"
    if [ -z "$GALAXY_CONFIG" ] ; then
	echo No Galaxy configuration file supplied >&2
	exit 1
    elif [ ! -e "$GALAXY_CONFIG" ] ; then
	echo ${GALAXY_CONFIG}: Galaxy configuration file not found >&2
	exit 1
    fi
    echo "Galaxy config: ${GALAXY_CONFIG}"
    # Get file owner
    if [ -z "$GALAXY_USER" ] ; then
	GALAXY_USER=$(stat -c '%U' ${GALAXY_CONFIG})
    fi
    echo "Galaxy user: ${GALAXY_USER}"
    # Disable master API key
    echo "Disabling master API key:"
    su - ${GALAXY_USER} -c "sed -i 's/ master_api_key: .*/ #master_api_key: changethis/g' ${GALAXY_CONFIG}"
    grep "master_api_key" ${GALAXY_CONFIG}
    # Re-enable master API key
    if [ ! -z "$MASTER_API_KEY" ] ; then
	echo "(Re-)enabling master API key:"
	su - ${GALAXY_USER} -c "sed -i 's/ #master_api_key: .*/ master_api_key: ${MASTER_API_KEY}/g' ${GALAXY_CONFIG}"
	grep "master_api_key" ${GALAXY_CONFIG}
    fi
    return 0
}

# Get the command line
if [ $# -lt 2 ] ; then
    usage
    exit
fi

# Fetch the command and Galaxy name
export COMMAND="$1"
export GALAXY="$2"

# Get options
export GALAXY_CONFIG=
export GALAXY_USER=
export MASTER_API_KEY=

update_config=
while [ ! -z "$3" ] ; do
    case "$3" in
	-c|--config)
	    # Galaxy configuration file
	    shift
	    GALAXY_CONFIG=$3
	    ;;
	-u|--user)
	    # Galaxy user
	    shift
	    GALAXY_USER=$3
	    ;;
	--master-api-key)
	    # Set master API key
	    shift
	    MASTER_API_KEY=$3
	    if [ -z "MASTER_API_KEY" ] ; then
		echo WARNING no master API key supplied
	    fi
	    update_config=yes
	    ;;
	--no-master-api-key)
	    # Disable master API key
	    MASTER_API_KEY=
	    update_config=yes
	    ;;
	*)
	    echo "$3: unknown option" >&2
	    exit 1
	    ;;
    esac
    shift
done

# Check for master API key setting

# Update Galaxy configuration
if [ ! -z "$update_config" ] ; then
    update_master_api_key
fi

# Perform the requested action
case $COMMAND in
    start)
	start_galaxy
	status=$?
	;;
    stop)
	stop_galaxy
	status=$?
	;;
    restart)
	stop_galaxy && start_galaxy
	status=$?
	;;
    *)
	echo "$COMMAND: unknown command" >&2
	exit 1
	;;
esac
echo Finished: $status
exit $status
##
#
