#!/bin/bash

CONTAINER_ID=$(docker ps -q --filter "ancestor=${DOCKER_IMAGE}:latest")

if [ -z "$CONTAINER_ID" ]; then
  echo "Failed to start  container"
  exit 1
fi

response= $(curl -d @events/event.json  http://localhost:3001/2015-03-31/functions/function/invocations)
# curl -d @events/event_no_message.json http://localhost:3001/2015-03-31/functions/function/invocations
# curl -d @events/event_missing_body.json  http://localhost:3001/2015-03-31/functions/function/invocations
expected= "{"statusCode": 200, "body": "The received message is: '{\"message\": \"hello world\"}'"}"
if [ "$response" == "$expected" ]; then
  echo "test passed"
  EXIT_STATUS=0
else
  echo "Test failed"
  EXIT_STATUS=1
fi
