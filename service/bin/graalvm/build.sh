#!/usr/bin/env bash
./mvnw -DskipTests -Pnative clean native:compile
./target/service &
export PID=$!
./bin/base.sh
