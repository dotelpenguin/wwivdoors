#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after=1 --foreground ${BBS_TIME}
source /home/wwiv/bbs/chains/.wwivrc_exit
