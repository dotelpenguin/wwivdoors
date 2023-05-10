#!/bin/bash
TITLE="MagiChat"
REMOTE="true"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
echo "${BBS_USER}"
cd /home/wwiv/bbs/doors/native/magichat
timeout --kill-after 1 --foreground ${BBS_TIME} /home/wwiv/bbs/doors/native/magichat/MagiChatDoor -l -USERNAME ${BBS_USER}
source /home/wwiv/bbs/chains/.wwivrc_exit
