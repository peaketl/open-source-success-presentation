#!/bin/bash

mkdir -p ./publish/images

# Remove existing images
docker rmi cos_data_and_technology_preso_webapp_app
docker rmi cos-data-and-technology-preso-webapp-app
docker rmi cos_data_and_technology_preso_webapp_db
docker rmi cos-data-and-technology-preso-webapp-db

# Build the image
docker build -f ./docker/App_Dockerfile --no-cache -t cos_data_and_technology_preso_webapp_app .
# Save to a tar file for distribution
docker save -o ./publish/images/cos_data_and_technology_preso_webapp_app.tar cos_data_and_technology_preso_webapp_app

# Build the image
docker build -f ./docker/DB_Dockerfile --no-cache -t cos_data_and_technology_preso_webapp_db .
# Save to a tar file for distribution
# Make sure the destination exists
docker save -o ./publish/images/cos_data_and_technology_preso_webapp_db.tar cos_data_and_technology_preso_webapp_db
