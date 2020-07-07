#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="LORD"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after=1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/lordx/lord -D$1 
source /home/wwiv/bbs/chains/.wwivrc_exit
