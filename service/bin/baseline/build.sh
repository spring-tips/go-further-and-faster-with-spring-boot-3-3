#!/usr/bin/env bash
cat pom.xml.backup || cp pom.xml pom.xml.backup
rm -rf target

./mvnw -DskipTests spring-boot:build-image

RUN_ID="$( docker run -d -e SPRING_DATASOURCE_HOSTNAME="host.docker.internal"  -p 8080:8080 -m=2g docker.io/library/service:0.0.1-SNAPSHOT )"

sleep 10

mkdir -p $HOME/Desktop/timings/
curl http://localhost:8080/dogs >> $HOME/Desktop/timings/baseline-dogs
curl http://localhost:8080/startup >> $HOME/Desktop/timings/baseline-startup
docker rm -f ${RUN_ID}




