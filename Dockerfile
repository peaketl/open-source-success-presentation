# Use the official Python image from the Docker Hub
FROM python:3.11-slim

RUN apt-get update -y

# Make sure ping command is available
RUN apt-get install -y iputils-ping

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /app
COPY entrypoint.sh .
# Grant entrypoint.sh execution permission
RUN chmod +x ./entrypoint.sh

COPY ping.sh .
COPY ping.py .

# Run entry point script
ENTRYPOINT [ "./entrypoint.sh" ]