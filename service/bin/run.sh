#!/usr/bin/env bash

export TIMINGS_DIR=$HOME/Desktop/timings
rm -rf $TIMINGS_DIR || echo "could not delete $TIMINGS_DIR "

for i in baseline graalvm cds ; do
  echo "building $i "
  ./bin/$i/build.sh
done

find  $TIMINGS_DIR -iname startup | while read l ; do
  STARTUP="$( cat $l  )"
  echo "$l $STARTUP"
done

