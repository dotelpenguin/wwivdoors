trap "echo" SIGHUP SIGINT SIGTERM
TITLE="Env Debug"
source /home/wwiv/bbs/chains/.wwivrc
if [ ! "${BBS_HOME_CHECK}" == "true" ]; then exit; fi

echo "%1 LEGACY CHAIN  => ${1}"
echo "%A CALLINFO      => ${2}"
echo "%C CHAIN         => ${3}"
echo "%D DORINF.DEF    => ${4}"
echo "%E DOOR32.SYS    => ${5}"
echo "%H SOCKET HANDLE => ${6}"
echo "%K GFILE COMMENT => ${7}"
echo "%M MODEM BAUD    => ${8}"
echo "%N NODE          => ${9}"
echo "%O PCBOARD.SYS   => ${10}"
echo "%P COMPORT       => ${11}"
echo "%R DOOR.SYS      => ${12}"
echo "%S COM BAUD      => ${13}"
echo "%T TIME LEFT     => ${14}"
echo "%U USER HANDLE   => ${15}"
read -t 20 -p "<<=Pause=>>"

echo -e "\n\nENVIRONMENT\n"
env | sort

read -t 20 -p "<<=Pause=>>"
stty --all

read -t 20 -p "<<=Pause=>>"

source /home/wwiv/bbs/chains/.wwivrc_exit
