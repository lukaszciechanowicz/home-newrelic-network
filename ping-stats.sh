#!/bin/bash

IFS=',' read -ra ADDR <<< "$PING_ENDPOINT"

while true;
do 
  for ENDPOINT in "${ADDR[@]}"; 
  do
    STATS=$(ping -n -c1 $ENDPOINT | sed -nre 's/^.* time=([0-9]+)\.[0-9]+ ms$/\1/p')
    echo "$ENDPOINT - $STATS"
  done
  sleep $PING_INTERVAL
done