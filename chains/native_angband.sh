#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Angband"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
stty cols 80
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/zangband -u${BBS_USER}
source /home/wwiv/bbs/chains/.wwivrc_exit
