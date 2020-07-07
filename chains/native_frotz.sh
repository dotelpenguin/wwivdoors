#!/bin/bash
TITLE="Text Adventure(${1})"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
INFOCOM_PATH=${HOME}
cp /home/wwiv/bbs/doors/frotz/${1} ${HOME}
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/jzip ${1}
source /home/wwiv/bbs/chains/.wwivrc_exit
