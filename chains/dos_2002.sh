#!/bin/bashi
TITLE="Dosemu Debug""
echo Node $1 
echo User $2
echo Misc $3
echo "Rem TradeWars 2002 Operating Transfer Config" > /home/bbs/dosemu/freedos/lovar.bat
echo "Rem SET TWNODE="$1 >> /home/bbs/dosemu/freedos/lovar.bat
echo "SET TWUSER="$2 >> /home/bbs/dosemu/freedos/lovar.bat
echo "SET DOOR="$3 >> /home/bbs/dosemu/freedos/lovar.bat
dosemu
source /home/wwiv/bbs/chains/.wwivrc_exit





