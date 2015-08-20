#!/usr/bin/env bash
if [ -n "$1" ]; then
	logFile=/home/logs/`date +%Y%m%d`/$1
    if [ -f $logFile ]; then
		if [ -n "$2" ]; then
			cm=$2
		else
			cm=vim
		fi
	if [ $cm = ">" ]; then
	    >$logFile
	else
	   $cm $logFile
	fi
    else
        echo Error: $logFile not exists
    fi

else
	echo Usage: showlog cms.log
fi
