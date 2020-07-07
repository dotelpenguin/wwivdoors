#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Usurper (NEW)"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi

cd /home/wwiv/bbs/doors/native/Usurper/GAME2
timeout --kill-after=1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/Usurper/GAME2/USURPER -d$1 -x
source /home/wwiv/bbs/chains/.wwivrc_exit
