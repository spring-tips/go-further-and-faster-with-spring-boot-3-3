#!/usr/bin/env bash

./mvnw -DskipTests clean package
java -jar target/service-0.0.1-SNAPSHOT.jar &
export PID=$!
./bin/base.sh




