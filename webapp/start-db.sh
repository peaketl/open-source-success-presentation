#!/bin/bash

# Start the database container
# This is good for development, when we need to debug our code with the database
# The Postgres DB is not setup for persistence, so it will be wiped out when the container is stopped
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-db))
docker rmi open-source-success-presentation-webapp-db --force
docker build -f ./docker/DB_Run_Dockerfile --no-cache -t open-source-success-presentation-webapp-db .
docker run --name open-source-success-presentation-webapp-db -p 5432:5432 -d open-source-success-presentation-webapp-db