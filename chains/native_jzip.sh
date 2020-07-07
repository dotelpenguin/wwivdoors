#!/bin/bash
TITLE="Text Adventure(${1})"
/home/wwiv/bbs/chains/status.sh "DOOR", "${TITLE}"
cd ${HOME}/${2}
timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/jzip -f 2 ${HOME}/${2}/${1}
/home/wwiv/bbs/chains/status.sh "DOOR", "TEXT ADVENTURE(MENU)"
