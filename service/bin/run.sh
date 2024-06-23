#!/usr/bin/env bash
for i in baseline graalvm cds ; do
  echo "building $i "
  ./bin/$i/build.sh
done