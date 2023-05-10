#!/bin/bash
TITLE="StarWars Ascii"
REMOTE="false"
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
cd /home/wwiv/bbs/doors/native/starwar
timeout --kill-after 1 --foreground ${BBS_TIME} /usr/bin/node /home/wwiv/bbs/doors/native/starwar/starwars.js
source /home/wwiv/bbs/chains/.wwivrc_exit
