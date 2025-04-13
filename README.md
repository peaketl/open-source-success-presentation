# Open Source Success Presentation

Welcome to the repository for the "Open Source Success" Presentation. This repository contains two distinct demos showcasing practical containerization and data management applications.

## Project Structure

- **/ping**: Demonstrates how to execute a simple bash script within a Docker container. The script performs a `ping` command to a specified destination and logs the results to a file. [Learn more](./ping/README.md).
- **/webapp**: A Flask-based web application that interacts with a PostgreSQL database. Users can submit data through an interactive form, and the application displays all stored data. [Learn more](./webapp/README.md).

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Cloning the Repository

```bash
git clone https://github.com/peaketl/open-source-success-presentation.git
cd open-source-success-presentation
```

## Running the Demos

### 1. PING Demo

Navigate to the `ping` directory to run the ping demo:

```bash
cd ping
./start.sh
```

Alternatively, use Docker Compose:

```bash
docker-compose up --build
```

This will execute a `ping` command and write the results to a log file.

### 2. WebApp Demo

Navigate to the `webapp` directory to run the web application demo:

```bash
cd webapp
./start.sh
```

Access the application at [http://localhost:5000](http://localhost:5000). Use the interactive form to submit data and view stored entries.

## Acknowledgments

Thanks to all the contributors and participants.

