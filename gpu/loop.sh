#!/bin/sh

# Loop indefinitely
while true; do
    # Start the Python script, use full paths
    /app/app.sh
    # Add a carriage return to the end of the log file
    echo -e "\r" >> /app/logs/gpu.log
done
