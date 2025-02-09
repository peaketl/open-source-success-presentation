#!/bin/bash

# Build the docker images
docker build -f ./App_Dockerfile --no-cache -t cos-data-and-technology-preso-webapp-app .
docker build -f ./DB_Dockerfile --no-cache -t cos-data-and-technology-preso-webapp-db .