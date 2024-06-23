#!/usr/bin/env bash

cat pom.xml.backup || cp pom.xml pom.xml.backup
cp pom.xml.backup pom.xml

rm -rf target

./mvnw -DskipTests package

ARTIFACT_NAME=service-0.0.1-SNAPSHOT
java -Djarmode=tools -jar target/${ARTIFACT_NAME}.jar extract
tree $ARTIFACT_NAME/

java -Dspring.aot.enabled=true -Dspring.context.exit=onRefresh -XX:ArchiveClassesAtExit=$ARTIFACT_NAME/application.jsa -jar $ARTIFACT_NAME/$ARTIFACT_NAME.jar

java -Dspring.aot.enabled=true -XX:SharedArchiveFile=$ARTIFACT_NAME/application.jsa -jar $ARTIFACT_NAME/${ARTIFACT_NAME}.jar &

PID=$!
sleep 2
mkdir -p $HOME/Desktop/timings/
curl http://localhost:8080/dogs  > $HOME/Desktop/timings/cds-dogs
curl http://localhost:8080/startup > $HOME/Desktop/timings/cds-startup
kill -9 $PID



