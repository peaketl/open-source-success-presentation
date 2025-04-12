# WebApp - Open Source Success Presentation

## Overview

This is a simple Flask web application that interacts with a PostgreSQL database. The application allows users to submit data through a form and displays the stored data.

The project includes:

- **Docker Configuration**: `App_Dockerfile` and `DB_Dockerfile` for containerizing the application and database, and `docker-compose.yml` for managing the services.
- **Scripts**: Various scripts to facilitate building, starting, and stopping the application and database containers.
- **Source Code**: The main application code in `app.py`.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

**Clone the Repository**:

```bash
git clone https://github.com/peaketl/open-source-success-presentation.git
cd open-source-success-presentation/webapp
```

**Grant `EXECUTE` permissions to the scripts**:

```bash
chmod +x ./build.sh
chmod +x ./start.sh
chmod +x ./stop.sh
chmod +x ./start-app.sh
chmod +x ./stop-app.sh
chmod +x ./start-db.sh
chmod +x ./stop-db.sh
```

**Build and Run the Application**:

```bash
./build.sh
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

- `webapp/`
  - `app.py`: Main Flask application code.
  - `App_Dockerfile`: Defines the Docker image for the Flask application.
  - `DB_Dockerfile`: Defines the Docker image for the PostgreSQL database.
  - `docker-compose.yml`: Configures Docker services for the web application and database.
  - `requirements.txt`: Python dependencies for the Flask application.
  - `build.sh`: Script to build the Docker images.
  - `start.sh`: Script to start the Docker containers.
  - `stop.sh`: Script to stop the Docker containers.
  - `start-app.sh`: Script to start the application container.
  - `stop-app.sh`: Script to stop the application container.
  - `start-db.sh`: Script to start the database container.
  - `stop-db.sh`: Script to stop the database container.

  ## Usage
  1. **Access the Web Application**: Open your web browser and navigate to http://localhost:5000. You will see a form to enter data and a list of stored data.
  2. **Submit Data**: Enter a name in the form and submit it. The data will be stored in the PostgreSQL database and displayed on the page.
  
## Acknowledgments
Thanks to all the contributors and participants.
