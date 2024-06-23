#!/usr/bin/env bash

./mvnw -DskipTests clean package
ARTIFACT_NAME=service-0.0.1-SNAPSHOT
rm -rf $ARTIFACT_NAME || echo "couldn't delete the artifact directory"
java -Djarmode=tools -jar target/${ARTIFACT_NAME}.jar extract
java -Dspring.aot.enabled=true -Dspring.context.exit=onRefresh -XX:ArchiveClassesAtExit=$ARTIFACT_NAME/application.jsa -jar $ARTIFACT_NAME/$ARTIFACT_NAME.jar
java -Dspring.aot.enabled=true -XX:SharedArchiveFile=$ARTIFACT_NAME/application.jsa -jar $ARTIFACT_NAME/${ARTIFACT_NAME}.jar &
export PID=$!
./bin/base.sh
