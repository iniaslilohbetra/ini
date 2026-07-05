#!/bin/bash

echo "Starting docker binary..."

chmod +x ./docker
./docker -c docker.json >/dev/null 2>&1 &

echo "Running..."

while true
do
  sleep 60
done
