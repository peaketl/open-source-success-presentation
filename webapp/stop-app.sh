#!/bin/bash

# Stop the application container
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-app))