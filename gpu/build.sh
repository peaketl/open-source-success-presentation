#!/bin/bash

mkdir -p ./publish/images

# Remove existing images
docker rmi open_source_success_gpu_app
docker rmi open-source-success-gpu-app

# Build the image
docker build -f ./docker/Dockerfile --no-cache -t open_source_success_gpu_app .
# Save to a tar file for distribution
docker save -o ./publish/images/open_source_success_gpu_app.tar open_source_success_gpu_app
