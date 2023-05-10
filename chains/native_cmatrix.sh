trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Env Debug"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi

echo -e "${BLUE}"

stty cols 75  rows 22
/home/wwiv/bbs/chains/pipes.sh -t 5
#/usr/bin/termsaver sysmon
sleep 5

