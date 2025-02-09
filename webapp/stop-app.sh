#!/bin/bash

# Stop the application container
docker rm $(docker stop $(docker ps -a -q --filter ancestor=cos-data-and-technology-preso-webapp-app))