FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

# Install Python and dependencies
# rm below will cleanup apt cache
RUN apt-get update && \
    apt-get install -y python3-pip python3.12-venv python3-dev python-is-python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Create a Python virtual environment
RUN python3 -m venv /usr/src/app/.venv

# Copy the custom script
COPY app.py .
COPY app.sh .
COPY loop.sh .
COPY ./docker/entrypoint.sh .
# Ensure the scripts is executable
RUN chmod +x ./app.sh
RUN chmod +x ./loop.sh
RUN chmod +x ./entrypoint.sh

# Copy the requirements file
COPY requirements.txt .

# Install the Python dependencies
RUN /usr/src/app/.venv/bin/pip install --no-cache-dir -r requirements.txt

# Run entry point script
ENTRYPOINT [ "./entrypoint.sh" ]