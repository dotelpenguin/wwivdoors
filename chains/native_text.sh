#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Text Adventure(Menu)"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
INFOCOM_PATH=${HOME}
cp -rf  /home/wwiv/bbs/doors/frotz/* ${HOME}
timeout --kill-after=1 --foreground ${BBS_TIME} python2 /home/wwiv/bbs/chains/native_text_menu.py
source /home/wwiv/bbs/chains/.wwivrc_exit
