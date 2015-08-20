#!/usr/bin/env bash

if [ -n "$1" ]; then
tomcatname=$1
tomcatRootDir=/home/tomcat/$tomcatname
tomcatShutdown=$tomcatRootDir/bin/shutdown.sh
tomcatStartUp=$tomcatRootDir/bin/startup.sh
echo $tomcatRootDir
echo $tomcatShutdown
echo $tomcatStartUp
    if [ -d $tomcatRootDir ]; then
        $tomcatShutdown
        sleep 3
        pkill -f tomcat/$tomcatname
	echo $tomcatStartUp
        $tomcatStartUp
    else
        echo Error: Tomcat node [$tomcatRootDir] not found.
    fi

else
echo Usage: $0 WEB_APP_NAME
fi
