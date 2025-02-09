#!/bin/sh

# Ensure logging folder exists
mkdir -p /app/logs

# Make sure log file exists
touch /app/logs/ping.log

# Copy files to app directory (mounted in docker compose volume)
cp -r /usr/src/app/* /app

# Make /app directory writeable by host OS
chmod -R 777 /app

# Make script executable
chmod +x /app/ping.sh

# Run the script
/app/ping.sh