#!/bin/sh

# Start the Python script, use full paths
ping "google.com" -i 5 >> /app/logs/ping.log 2>&1