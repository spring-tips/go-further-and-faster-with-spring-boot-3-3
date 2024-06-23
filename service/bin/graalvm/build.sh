#!/usr/bin/env bash
cat pom.xml.backup || cp pom.xml pom.xml.backup
cp pom.xml.backup pom.xml

rm -rf target
./mvnw -DskipTests -Pnative native:compile


./target/service &
PID=$!
sleep 3
mkdir -p $HOME/Desktop/timings/
curl http://localhost:8080/dogs > $HOME/Desktop/timings/graalvm-dogs
curl http://localhost:8080/startup  > $HOME/Desktop/timings/graalvm-startup

kill -9 $PID




