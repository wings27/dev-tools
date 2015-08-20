#!/usr/bin/env bash

getPidByName(){
    pids=`ps -ef|grep $1|grep -v grep|awk '{print $2}'`
    echo $pids
}
killPName(){
    pids=`ps -ef|grep $1|grep -v grep|awk '{print $2}'`
    if [ -z "$pids" ]; then
        echo Warning: Process $1 not found.
    fi
    for pidItem in $pids
    do
        kill -9 $pidItem
        sleep 1
    done
}
