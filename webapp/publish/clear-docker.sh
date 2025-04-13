#!/bin/bash

# Use with caution!
# Note that this script clears all the docker images and volumes on the host, not just the ones related to this project.
# The purpose of this script is to help setup the presentation and while in the Git repository really isn't part of the demos

# Confirm with the user before proceeding
read -p "Are you sure you want to delete all Docker images and volumes? This action is irreversible! (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
    echo "Aborted."
    exit 1
fi

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -q)

# Remove all containers
echo "Removing all containers..."
docker rm $(docker ps -aq)

# Remove all Docker images
echo "Removing all Docker images..."
docker rmi -f $(docker images -q)

# Remove all Docker volumes
echo "Removing all Docker volumes..."
docker volume rm $(docker volume ls -q)

# Remove unused networks
echo "Removing unused networks..."
docker network prune -f

echo "All Docker images, volumes, containers, and unused networks have been deleted."

