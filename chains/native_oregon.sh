#!/bin/bash
TITLE="Oregon Trail"
REMOTE="false"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
timeout --kill-after 1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/oregon/oregon -l -USERNAME ${BBS_USER}
source /home/wwiv/bbs/chains/.wwivrc_exit
