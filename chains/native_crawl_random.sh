#!/bin/bash
trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Dungeon Cawl"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
export CRAWL_NAME=${BBS_USER}
export CRAWL_DIR="${BBS_USER_HOME}/crawl_rand"
mkdir -p ${CRAWL_DIR}
echo -e "${BLUE}Please wait building universe, ${YELLOW}New games will take a few minutes${CLEAR}"
echo -e "\n\n${PURPLE} Dungeon seed is random.\n\n"
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/crawl
source /home/wwiv/bbs/chains/.wwivrc_exit
