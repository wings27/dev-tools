#!/usr/bin/env bash

## deploy war file and restart tomcat.

if [ $# != 1 ] ; then
  echo Need ONE Argument!
  echo Usage: $0 WEB_APP_NAME
  exit 1
fi

basePath='/home/site'
warFileName=$1
warFile=$warFileName.war
warPath=$basePath'/'$warFileName

cd $warPath

if [ $? -ne 0 ];then
  echo Exiting due to error: No app found with path: $warPath.
  exit 1
fi

## modify this with caution!
ls | grep -v $warFile | xargs rm -rf
unzip -o $warFile
echo Tomcat node [$warFileName] pid: `pgrep -f tomcat-$warFileName`
echo Restarting tomcat node [$warFileName].
echo $warFileName
tomcatRestart.sh $warFileName
sleep 1
echo Tomcat node [$warFileName] pid: `pgrep -f tomcat-$warFileName`
echo

