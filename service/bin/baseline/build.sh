#!/usr/bin/env bash

cat pom.xml.backup || cp pom.xml pom.xml.backup
cp pom.xml.backup pom.xml

rm -rf target

./mvnw -DskipTests package



PID=$( java -jar target/*jar & )
echo $PID

mkdir -p $HOME/Desktop/timings/
curl http://localhost:8080/dogs >> $HOME/Desktop/timings/baseline-dogs
curl http://localhost:8080/startup >> $HOME/Desktop/timings/baseline-startup




