#!/bin/bash

# Ensure logging folder exists for cron job, also used by app
mkdir -p /app/logs

# Make sure cron log file exists
touch /app/logs/ping.log

# Copy files to app directory (mounted in docker compose volume)
cp -r /usr/src/app/* /app

# Make /app directory writeable by host OS
chmod -R 777 /app

# Make script executable
chmod +x /app/ping.sh

bash /app/ping.sh