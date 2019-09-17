#!/bin/bash

while true; 
do 
  STATS=$(ping -n -c1 $PING_ENDPOINT | sed -nre 's/^.* time=([0-9]+)\.[0-9]+ ms$/\1/p')
  echo $STATS
  sleep $PING_INTERVAL
done