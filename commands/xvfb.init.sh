#!/usr/bin/env bash

### BEGIN INIT INFO
# Provides:          Xvfb
# Required-Start:    
# Required-Stop:     
# Default-Start:     
# Default-Stop:      
# Short-Description: Stop/start Xvfb
### END INIT INFO

XVFB=/usr/bin/Xvfb
XVFBARGS="$DISPLAY -screen 0 $SCREEN_RESOLUTION -ac +extension GLX +render -noreset";
PIDFILE='/var/run/xvfb.pid';

case "$1" in
  start)
    echo -n "Starting virtual X frame buffer: Xvfb"
    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer: Xvfb"
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
    exit 1
esac

exit 0