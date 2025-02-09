# Use the official Python image from the Docker Hub
FROM alpine:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /app
COPY entrypoint.sh .
# Grant entrypoint.sh execution permission
RUN chmod +x ./entrypoint.sh

# Copy the application files
COPY ping.sh .

# Run entry point script
ENTRYPOINT [ "./entrypoint.sh" ]