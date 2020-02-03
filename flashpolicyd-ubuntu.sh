#!/bin/bash
#
# Init file for the flashpolicy server daemon
#
# chkconfig: 2345 20 20
# description: Starts a server on port 843 to server flash policy requests
#
# processname: flashpolicyd.rb

# Source function library.
. /lib/lsb/init-functions

desc="Flash policy server"
prog="flashpolicyd"

# these can be overrode in /etc/sysconfig/flashpolicyd
RETVAL=0
TIMEOUT=10
XML=/asi/conf/flashpolicyd/flashpolicy.xml
LOGFREQ=1800
LOGFILE=/var/log/flashpolicyd.log
USER=root
BINDIR=/usr/sbin
PORT=843

if [ -r /etc/default/$prog ]; then
  source /etc/default/$prog
fi

${BINDIR}/${prog} --timeout=${TIMEOUT} --xml=${XML} --logfreq=${LOGFREQ} --logfile=${LOGFILE} --user=${USER} --port=${PORT}
