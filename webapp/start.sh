#!/bin/bash

# Start the docker containers
# This start the entire application

# Stop and cleanup and existing app containers
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-app))
docker rmi open-source-success-presentation-webapp-app --force

# Stop and cleanup and existing db containers
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-db))
docker rmi open-source-success-presentation-webapp-db --force

# Rebuild and start
docker compose up --build --detach