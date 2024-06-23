#!/usr/bin/env bash

cat pom.xml.backup || cp pom.xml pom.xml.backup
cp pom.xml.backup pom.xml

rm -rf target

./mvnw -DskipTests package

java -jar target/service-0.0.1-SNAPSHOT.jar &
PID=$!
sleep 5
mkdir -p $HOME/Desktop/timings/
curl http://localhost:8080/dogs  > $HOME/Desktop/timings/baseline-dogs
curl http://localhost:8080/startup > $HOME/Desktop/timings/baseline-startup

kill -9 $PID



