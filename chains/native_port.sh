#!/bin/bash
TITLE="Port Victoria"
REMOTE="false"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
cd /home/wwiv/bbs/doors/native/portvictoria
timeout --kill-after 1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/portvictoria/portvic -l -USERNAME ${BBS_USER}
source /home/wwiv/bbs/chains/.wwivrc_exit
