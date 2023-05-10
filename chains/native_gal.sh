#!/bin/bash
TITLE="Galactic Dynasty"
REMOTE="false"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
cd /home/wwiv/bbs/doors/native/galactic-dynasty
timeout --kill-after 1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/galactic-dynasty/GalacticDynasty ${BBS_CHAINS}/door32.sys
source /home/wwiv/bbs/chains/.wwivrc_exit
