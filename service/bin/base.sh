#!/usr/bin/env bash

PPID=$(ps -o ppid= -p $$)
PARENT_COMMAND=$(ps -o args= -p "$PPID")
PARENT_COMMAND_PATH=$(echo $PARENT_COMMAND | cut -d ' ' -f 2)
IFS='/' read -ra ADDR <<< "$PARENT_COMMAND_PATH"
MODULE="${ADDR[2]}"
sleep 3
TIMINGS_DIR=$HOME/Desktop/timings/${MODULE}
mkdir -p $TIMINGS_DIR
curl http://localhost:8080/dogs > $TIMINGS_DIR/dogs
curl http://localhost:8080/startup  > $TIMINGS_DIR/startup
kill -9 $PID