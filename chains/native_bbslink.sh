#!/bin/bash
TITLE="BBSLINK(${1})"
REMOTE="true"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after 1 --foreground ${BBS_TIME} python /home/wwiv/bbs/chains/native_bbslink.py ${1} ${BBS_USER_NUM}
source /home/wwiv/bbs/chains/.wwivrc_exit
