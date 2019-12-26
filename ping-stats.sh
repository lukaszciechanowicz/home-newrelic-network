#!/bin/bash

IFS=',' read -ra ADDR <<< "$PING_ENDPOINT"

function build_nr_message_body {
  REQUEST_BODY="[{\"eventType\":\"Ping\",\"endpoint\":\"$ENDPOINT\",\"response\":$RESPONSE_TIME}]"
}

function get_response_time {
    RESPONSE_TIME=$(ping -n -c1 $ENDPOINT | sed -nre 's/^.* time=([0-9]+)\.[0-9]+ ms$/\1/p')
    echo "$ENDPOINT: $RESPONSE_TIME"
}

function send_nr_request {
  echo $REQUEST_BODY | gzip | curl --data-binary @- -X POST -H "Content-Type: application/json" -H "X-Insert-Key: $NR_API_KEY" -H "Content-Encoding: gzip" https://insights-collector.newrelic.com/v1/accounts/$NR_ACCOUNT_ID/events
}

while true;
do 
  for ENDPOINT in "${ADDR[@]}"; 
  do
    get_response_time
    build_nr_message_body
    send_nr_request
  done
  sleep $PING_INTERVAL
done