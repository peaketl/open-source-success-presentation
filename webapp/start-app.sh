#!/bin/bash

# Start the application container
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-app))
docker rmi open-source-success-presentation-webapp-app --force
docker build -f ./docker/App_Dockerfile --no-cache -t open-source-success-presentation-webapp-app .
docker run --name open-source-success-presentation-webapp-app -p 5000:5000 -d open-source-success-presentation-webapp-app