#!/bin/bash
BBS_STATUS=${1^^}
BBS_DESCRIPTION=${2^^}
export BBS_PID="$(echo $$)"
export BBS_PPID="$(echo $PPID)"

STATUS_JSON="{ \"STATUS\": \"${BBS_STATUS}\", \"DESCRIPTION\": \"${BBS_DESCRIPTION}\", \"PID\": ${BBS_PID}, \"PPID\": ${BBS_PPID} }"
echo "${STATUS_JSON}" > /home/wwiv/bbs/temp/${WWIV_INSTANCE}/status.json
