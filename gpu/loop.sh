#!/bin/sh

# Loop indefinitely
while true; do
    # Start the Python script, use full paths
    /app/app.sh
    # Add line breaks to the log file
    echo "" >> /app/logs/gpu.log
    echo "" >> /app/logs/gpu.log
done
