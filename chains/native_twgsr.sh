#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
METHOD=$1
ADDRESS=$2
PORT=$3
TITLE="TradeWars 2002 - Local TWGS"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/bin/rsh-redone-rlogin -p ${PORT} -l ${BBS_USER} ${ADDRESS}
source /home/wwiv/bbs/chains/.wwivrc_exit
