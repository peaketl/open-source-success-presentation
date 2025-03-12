#!/bin/bash

set -e  # Exit on first error

# Copy files to app directory (mounted in docker compose volume)
cp -r /usr/src/app/* /app

# Make /app directory writeable by host OS
chmod -R 777 /app

# Confirm the .env file exists
if [ ! -f "/app/.env" ]; then
    echo "No .env file found"
    exit 1
fi

/usr/local/bin/python /app/app.py