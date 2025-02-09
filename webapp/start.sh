#!/bin/bash

# Start the docker containers
# This start the entire application

# Stop and cleanup and existing app containers
docker rm $(docker stop $(docker ps -a -q --filter ancestor=cos-data-and-technology-preso-webapp-app))
docker rmi cos-data-and-technology-preso-webapp-app --force

# Stop and cleanup and existing db containers
docker rm $(docker stop $(docker ps -a -q --filter ancestor=cos-data-and-technology-preso-webapp-db))
docker rmi cos-data-and-technology-preso-webapp-db --force

# Rebuild and start
docker compose up --build --detach