#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
METHOD=$1
ADDRESS=$2
PORT=$3
TITLE="Portal - ${2}"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/bin/plink -${METHOD} -P ${PORT} ${ADDRESS}
source /home/wwiv/bbs/chains/.wwivrc_exit
