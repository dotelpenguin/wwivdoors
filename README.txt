# wwivdoors
# Custom WWIV Door/Chain Configs

# Example Linux Chain.

  Editing Chain #3

  A) Description  : Cave of Phear (Local)
  B) Filename     : ../../chains/native_phear.sh
  C) SL           : 50
  D) AR           : None.
  E) ANSI         : Required
  F) Exec Mode:     STDIO
  I) Launch From  : Temp/Node Directory
  J) Local only   : No
  K) Multi user   : Yes
  L) Registered by: AVAILABLE
  M) Usage        : 29
  N) Age limit    : 0 - 255

  (Q=Quit) Which (A-N,R,[,]) :


B) Filename can be full path, I however simplify by stepping back 2 directories from the temp/node folder.  Makes a cleaner menu but 100% Personal preference.
F) MOST native linux apps that do not have their own Comm routines should be STDIO, if they misbehave try None or Normal
I) I prefer to launch everything from a Temp/Node directory, so I can manage each user and node data seperatly.




Door flow

1. Spawns chain script from /chains directory (we will use native_phear.sh as example)
2. chain script

   1 #!/bin/bash
   2 trap "echo" SIGHUP SIGINT SIGTERM
   3 TITLE="Cave of Phear"
   4 source /home/wwiv/bbs/chains/.wwivrc
   5 if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi
   6 timeout --kill-after=1 --foreground ${BBS_TIME} /usr/games/phear
   7 source /home/wwiv/bbs/chains/.wwivrc_exit

  1 => Setup our bash interpreter
  2 => We set a trap to kill off process on errors
  3 => I require a title be configured for logs and status
  4 => Calls .wwivrc. This sets up the environment, parses nodes, users, colors, and other things (see below)
  5 => Aborts if something failed in setting up envionrment in .wwivrc
  6 => Launches the linux  application using timeout. This will take the users max time from drop files, and  fore application to terminate if door/chain hung.
  7 => Calls .wwivrc_exit to cleanup after door/chain exits
  
  
  wwivrc script explained a bit
  
  
  ## Exports  language (I prefer to lock my bbs with the IBM437 character set)
  export LANG=en_US.IBM437
  ## Also exports some color variables to make things a little cleaner
  export RED='\033[0;31m'
  export GREEN='\033[0;32m'
  export BLUE='\033[0;34m'
  export PURPLE='\033[0;35m'
  export YELLOW='\033[0;33m'
  export CLEAR='\033[0m'
  export WHITE='\033[97m'
  ## Prints out Chainloader to user with color
  echo -e "${BLUE}WWIV ${GREEN}Chain Loader${YELLOW} V1.20 ${WHITE}[${PURPLE}${TITLE}${WHITE}]${CLEAR}"

  ## Checks if a Title was given. Since I track external status updates I want these to always exist
  if [ -z "${TITLE}" ]; then
          echo -e "${RED}Sanity Check Failed\n${YELLOW}Reconfigure chains to include title string\n\n${PURPLE}"
          read -t 10 -p "<<=Pause=>>"
          exit
  fi

  ## I do not want to run chains directly from BBS directory by accident. So I made a check to halt door if this is detected
  if [ "${PWD}" = "/home/wwiv/bbs" ]; then
          echo -e "${RED}Sanity Check Failed\n${YELLOW}Reconfigure chains for Temp/Home\n\n${PURPLE}"
          read -t 10 -p "<<=Pause=>>"
          exit
  fi 

  ##  Function to convert seconds to human readable format (I'm sure there are better ways to do this)
  function displaytime {
    local T=$1
    local D=$((T/60/60/24))
    local H=$((T/60/60%24))
    local M=$((T/60%60))
    local S=$((T%60))
    (( $D > 0 )) && printf '%d days ' $D
    (( $H > 0 )) && printf '%d hours ' $H
    (( $M > 0 )) && printf '%d minutes ' $M
    (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
    printf '%d seconds\n' $S
  }

  ## Exports Global Variable for Doors,
  ## Current Chain DIR
  export BBS_CHAINS=${PWD}
  ## User name
  export BBS_USER=$(cat ${PWD}/chain.txt | sed '2!d')
  ## Real Name
  export BBS_NAME=$(cat ${PWD}/chain.txt | sed '3!d')
  ## WWIV User Number
  export BBS_USER_NUM=$(cat ${PWD}/chain.txt | sed '1!d')
  ## Time remaining 
  export BBS_TIME=$(cat ${PWD}/chain.txt | sed '16!d' | tr -d '[:space:]' | awk -F"." '{print $1}')
  ## Personal folder for user
  export BBS_USER_HOME="${WWIV_DIR}/doors/homedir/${BBS_USER}"

  ## Lets User know how much time they will be allowed in door/chain
  echo -e "${BLUE}USER:${PURPLE} ${BBS_USER} ${GREEN}[${YELLOW}${BBS_USER_NUM}${GREEN}]${CLEAR}"
  echo -e "${BLUE}Chain will be ${YELLOW}terminated ${BLUE}automaticaly in ${YELLOW}$(displaytime ${BBS_TIME})${CLEAR}\n"

  ## Checks if door is hosted off local BBS. if so displays a now leaving message
  if [ "${REMOTE}" = "true" ]; then
          cat /home/wwiv/bbs/gfiles/LEAVING.ANS
          sleep 5
  fi

  ## Creates user folder if it doesn't exist, and sets up some final golbals
  mkdir -p ${BBS_USER_HOME}
  export HOME=${BBS_USER_HOME}
  export TERM=xterm-color
  export TERMINFO=/etc/terminfo
  export BBS_HOME_CHECK="true"
  ## Updates web interface with user status
  /home/wwiv/bbs/chains/status.sh "DOOR" "${TITLE}"
  cd ${HOME}
  sleep 2
  
  
wwivrc_exit script

    ## Gets exit code from last door
    EXIT_RESULT="$?"
    clear
    ## If exit code was 124, this means it was terminated by the timeout function, otherwise returns to BBS
    if [ "${EXIT_RESULT}" -eq 124 ]; then
          echo -e "${RED}TIme Expired: ${BLUE}Returning to ${YELLOW}StarDoc 134${CLEAR}"
    else
          echo -e "${BLUE}Returning to ${YELLOW}StarDoc 134${CLEAR}"
    fi
    ## Update web interface to show they have returned back to the BBS
    /home/wwiv/bbs/chains/status.sh "BBS" "MENU"
    sleep 2
  
