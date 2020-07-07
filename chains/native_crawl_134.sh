#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Dungeon Crawl"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
export CRAWL_NAME=${BBS_USER}
export CRAWL_DIR="${BBS_USER_HOME}/crawl_134"
export SCORE_DIR="/home/wwiv/bbs/gfiles/134crawl"
mkdir -p ${CRAWL_DIR}
echo -e "${BLUE}Please wait building universe, ${YELLOW}New games will take a few minutes${CLEAR}"
echo -e "\n\n${PURPLE}All users get the same Dungeon. Dungeon seed is always 134, and will remain the same between deaths\n\n"
sleep 4
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/crawl -seed 134
source /home/wwiv/bbs/chains/.wwivrc_exit
