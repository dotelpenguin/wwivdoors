#!/bin/bash
#
# Trade Wars 2002 chain
#
TITLE="Trade Wars 2002"
trap "echo" SIGHUP SIGINT SIGTERM
source ~/.wwivrc

NODE=$1

# we need to convert the chain.txt file to DOS format.  TW doesn't like unix files
unix2dos ~/temp${NODE}/chain.txt > /dev/null 2>&1

dosemu -f ~/.dosemurc -I "dosbanner 0" -E "tw2002.bat ${NODE}" 2>/dev/null
source /home/wwiv/bbs/chains/.wwivrc_exit
