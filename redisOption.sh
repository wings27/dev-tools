#!/bin/sh
cd /usr/local/bin/
option=$1
key=$2
value=$3
if [ "$1" = "get" ]; then
	./redis-cli -p 6380 get $2
elif [ "$1" = "set" ]; then
	./redis-cli -p 6380 set $2 $3
elif [ "$1" = "del" ]; then
	./redis-cli -p 6380 del $2
elif [ "$1" = "ttl" ]; then
	./redis-cli -p 6380 TTL $2
fi
 
