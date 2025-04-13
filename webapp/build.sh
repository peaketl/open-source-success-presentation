#!/bin/bash

mkdir -p ./publish/images

# Remove existing images
docker rmi open_source_success_presentation_webapp_app
docker rmi open-source-success-presentation-webapp-app
docker rmi open_source_success_presentation_webapp_db
docker rmi open-source-success-presentation-webapp-db

# Build the image
docker build -f ./docker/App_Dockerfile --no-cache -t open_source_success_presentation_webapp_app .
# Save to a tar file for distribution
docker save -o ./publish/images/open_source_success_presentation_webapp_app.tar open_source_success_presentation_webapp_app

# Build the image
docker build -f ./docker/DB_Dockerfile --no-cache -t open_source_success_presentation_webapp_db .
# Save to a tar file for distribution
# Make sure the destination exists
docker save -o ./publish/images/open_source_success_presentation_webapp_db.tar open_source_success_presentation_webapp_db
