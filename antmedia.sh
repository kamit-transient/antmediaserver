#!/bin/sh
#  /etc/init.d/antmedia

### BEGIN INIT INFO
# Provides:          AntMedia
# Required-Start:    $remote_fs $syslog $network
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts the ant media service
# Description:       This file is used to start the daemon and should be placed in /etc/init.d
# chkconfig: 2345 85 85
# processname: red5
### END INIT INFO

# Author:   Sheldon Neilson <sheldon[AT]neilson.co.za>
# Url:      www.neilson.co.za
# Date:     25/04/2013
# Modified by Paul Gregoire <mondain[AT]gmail.com> on 18 May 2016

NAME="antmedia"
DESC="Ant Media Service"


# The path to the folder containing daemon jar
FILE_PATH="/home/app/$NAME"



#define ulimit
ulimit -n 65536

case "$1" in
    start)  
        echo "Starting the $DESC..."        
        
        # Start the service
        cd $FILE_PATH
        ./start.sh &
        
        echo "The $DESC has started."
    ;;
    stop)
        echo "Stopping the $DESC..."
        
        # Stop the service 
        cd $FILE_PATH
        ./shutdown.sh    
        
        echo "The $DESC has stopped."
    ;;
    restart)
        echo "Restarting the $DESC..."
        cd $FILE_PATH
        ./shutdown.sh  
        ./start.sh
        echo "The $DESC has restarted."
            ;;
    *)
    echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
    exit 3
    ;;
esac
