#!/bin/sh

# chkconfig: 345 99 01
# description: run ProFTPd for Galaxy FTP uploads

# ProFTPD files
FTPD_BIN=/usr/local/sbin/proftpd
FTPD_CONF=/usr/local/etc/proftpd-galaxy.conf
PIDFILE=/var/run/proftpd.pid

# If PIDFILE exists, does it point to a proftpd process?

if [ -f $PIDFILE ]; then
    pid=`cat $PIDFILE`
fi

if [ ! -x $FTPD_BIN ]; then
    echo "$0: $FTPD_BIN: cannot execute"
    exit 1
fi

case $1 in

    start)
	if [ -n "$pid" ]; then
            echo "$0: proftpd [PID $pid] already running"
            exit
	fi

	if [ -r $FTPD_CONF ]; then
            echo "Starting proftpd..."
            $FTPD_BIN -c $FTPD_CONF
	else
            echo "$0: cannot start proftpd -- $FTPD_CONF missing"
	fi
	;;

    stop)
	if [ -n "$pid" ]; then
            echo "Stopping proftpd..."
            kill -TERM $pid
	else
            echo "$0: proftpd not running"
            exit 1
	fi
	;;

    status)
	if [ -n "$pid"]; then
	    echo "proftpd [PID $pid] running"
	else
            echo "proftpd stopped"
	fi
	;;

    restart)
      if [ -n "$pid" ]; then
        echo "Rehashing proftpd configuration"
        kill -HUP $pid

      else
        echo "$0: proftpd not running"
        exit 1
      fi
      ;;

    *)
	echo "usage: $0 {start|stop|restart}"
	exit 1
	;;

esac

exit 0
