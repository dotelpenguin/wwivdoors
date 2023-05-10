#!/bin/bash
TITLE="WWIV IRC"
REMOTE="irc"
CHANNEL=$1
SERVER=$2
trap "echo" SIGHUP SIGINT SIGTERM
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
export TERM=dumb
reset
stty erase ^H
echo -e "${WHITE} Joining ${YELLOW}${SERVER}:${GREEN}${CHANNEL}.\n\n"
timeout --kill-after 1 --foreground ${BBS_TIME} epic5  -c "#${CHANNEL}" ${BBS_USER}_SD134 ${SERVER}
source /home/wwiv/bbs/chains/.wwivrc_exit
