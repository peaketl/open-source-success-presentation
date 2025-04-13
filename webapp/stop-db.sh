#!/bin/bash

# Stop the database container
# The Postgres DB is not setup for persistence, so it will be wiped out when the container is stopped
docker rm $(docker stop $(docker ps -a -q --filter ancestor=open-source-success-presentation-webapp-db))