# PING - Open Source Success Presentation

## Overview

Simple demo that executes a bash script within a Docker container.

The script executes a `ping` command and writes the results to a log file

The project includes:

- **Docker Configuration**: A `Dockerfile` and `docker-compose.yml` for containerizing the application.
- **Scripts**: Various scripts to facilitate building and running the application.
- **Source Code**: The main application code in `ping.py`.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

**Clone the Repository**:

```bash
git clone https://github.com/peaketl/open-source-success-presentation.git
cd open-source-success-presentation
```

**Grant `EXECUTE` permissions to the scripts**
```bash
chmod +x ./build.sh
chmod +x ./start.sh
chmod +x ./stop.sh
```
You can also give execute permission to `./ping.sh` and test it directly
```bash
chmod +x ./ping.sh
./ping.sh
```

**Build and Run the Application**:
```bash
./build.sh
```
Start the application
```bash
./start.sh
```
Alternatively, you can manually build and run the Docker containers:
```bash
docker-compose up --build
```

**Stopping the Application**:
```bash
./stop.sh
```

## Project Structure

- `ping/`
  - `ping.sh`: Bash script to ping a destination and log results.
  - `Dockerfile`: Defines the Docker image for the ping demo.
  - `docker-compose.yml`: Configures Docker services for the ping demo.
  - `build.sh`: Script to build and run the Docker containers.
  - `entrypoint.sh`: Entry point script for the Docker container.

## Usage

1. **Modify the Ping Script**:
   Edit `ping.sh` to change the destination address if needed.

2. **Run the Demo**:
   Execute the bash script using Docker as described above. Logs will be saved to the specified log file.

   The `docker-compose.yml` file is configured to map a Docker host folder to the container `/app` folder

   This folder can be accessed from the host to view the log file

## Acknowledgments

Thanks to all the contributors and participants

