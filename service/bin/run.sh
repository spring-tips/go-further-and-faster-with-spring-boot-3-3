#!/usr/bin/env bash

export TIMINGS_DIR=$HOME/Desktop/timings

for i in baseline graalvm cds ; do
  echo "building $i "
  ./bin/$i/build.sh
done

find  $TIMINGS_DIR -iname startup | while read l ; do
  STARTUP="$( cat $l | jq -r '.startup' )"
  echo "$l $STARTUP"
done

