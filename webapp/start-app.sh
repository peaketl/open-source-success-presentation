#!/bin/bash

# Start the application container
docker rm $(docker stop $(docker ps -a -q --filter ancestor=cos-data-and-technology-preso-webapp-app))
docker rmi cos-data-and-technology-preso-webapp-app --force
docker build -f ./docker/App_Dockerfile --no-cache -t cos-data-and-technology-preso-webapp-app .
docker run --name cos-data-and-technology-preso-webapp-app -p 5000:5000 -d cos-data-and-technology-preso-webapp-app