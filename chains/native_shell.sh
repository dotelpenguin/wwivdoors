#!/bin/bash
TITLE="Debug Shell"
REMOTE="false"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
cd /home/wwiv/bbs
timeout --kill-after 1 --foreground ${BBS_TIME} /bin/bash 
source /home/wwiv/bbs/chains/.wwivrc_exit
