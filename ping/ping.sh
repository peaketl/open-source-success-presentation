#!/bin/bash
/usr/local/bin/python /app/ping.py "google.com" >> /app/logs/ping.log 2>&1
# Delay for 5 seconds
sleep 5