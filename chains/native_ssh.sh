#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
ADDRESS=$1
PORT=$2
USER=$3
PASSWORD=$4
KEY=$5
TITLE="Portal - ${1}"
source /home/wwiv/bbs/chains/.wwivrc
stty cols 80 rows 25
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
if [ "${PASSWORD}" = "key" ]; then
	timeout --kill-after=1 --foreground ${BBS_TIME} /usr/bin/ssh -i /home/wwiv/bbs/.ssh/${KEY} ${USER}@${ADDRESS}
else
	timeout --kill-after=1 --foreground ${BBS_TIME} /usr/bin/ssh ${USER}  ${ADDRESS}
fi
source /home/wwiv/bbs/chains/.wwivrc_exit
