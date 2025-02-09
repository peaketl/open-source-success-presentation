#!/bin/bash

# Stop the application container and cleanup
docker rm $(docker stop $(docker ps -a -q --filter ancestor=cos-data-and-technology-preso-ping-app))
docker rmi cos-data-and-technology-preso-ping-app --force

# Build the docker image
docker build --no-cache -t cos-data-and-technology-preso-ping-app .