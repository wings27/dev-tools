#!/bin/sh
cd /usr/local/bin/
for i in `./redis-cli -p 6380 keys "*"` ; do
   ./redis-cli -p 6380 del $i 
done
