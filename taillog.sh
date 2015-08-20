#!/usr/bin/env bash
logPath=/home/logs/`date +%Y%m%d`
logNames=`ls $logPath`
complete -W "$logNames" taillog.sh
if ! [ -n "$1" ]; then
        echo "Usage: $0 {oms|cms|pms|www|opms|...}[.log]"
        exit -1
fi

if [ -n "$1" ]; then
    logFile1=$logPath/$1
    if ! [[ $logFile1 =~ .*\.log$ ]]; then    
        logFile1=$logFile1'.log'
    fi
fi

if [ -n "$2" ]; then
    logFile2=$logPath/$2
    if ! [[ $logFile2 =~ .*\.log$ ]]; then
        logFile2=$logFile2'.log'
    fi
fi

if [ -n "$3" ]; then
    logFile3=$logPath/$3
    if ! [[ $logFile3 =~ .*\.log$ ]]; then
        logFile3=$logFile3'.log'
    fi
fi

echo -e "\e[1;32m=========================== taillog ==========================="
echo -e "\e[0m"
tail -n 0 -f $logFile1 $logFile2 $logFile3

