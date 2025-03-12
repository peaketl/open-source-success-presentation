#!/bin/bash

REMOTE_APP_DIR="~/apps/cos-data-and-technology-preso/webapp"
SCP_TARGET=jason@cos-data-and-technology-03-19-2025-google-vm.peaketl.com
SCP_PORT=24151

# if there is no .env file, check the parent folder
if [ ! -f "./publish/.env" ]; then
    # Check the current folder
    if [ ! -f "./.env" ]; then
        # Check the parent folder
        if [ ! -f "../.env" ]; then
            echo "No .env file found"
            exit 1
        else
            ENV_FILE="../.env"
        fi
    else
        ENV_FILE="./.env"
    fi
else
    ENV_FILE="./publish/.env"
fi

echo "Using .env file: $ENV_FILE"

# Send the tar files to the remote server using scp
echo "Sending files to $SCP_TARGET:$SCP_PORT"
scp -P $SCP_PORT $ENV_FILE ./publish/images/*.tar ./publish/App_Dockerfile ./publish/DB_Dockerfile ./publish/docker-compose.yml $SCP_TARGET:$REMOTE_APP_DIR

# Login to the remote server to load the images
# For some reason new version of docker save with dashes in the name even
# if the image uses underscores. So we just delete and remove both versions below.
# You can run docker image -ls on the remote server to confirm the image names.
# there should be 4 images, 2 for the app and 2 for the db
echo "Logging into $SCP_TARGET:$SCP_PORT"
ssh -p $SCP_PORT $SCP_TARGET << EOF
echo "Updating the POSTGRES_SERVER variable in $REMOTE_APP_DIR/.env to db for internal docker network"
sed -i "s/POSTGRES_SERVER=.*/POSTGRES_SERVER=db/" $REMOTE_APP_DIR/.env
echo "Updating the POSTGRES_PORT variable in $REMOTE_APP_DIR/.env to default port 5432 for internal docker network"
sed -i "s/POSTGRES_PORT=.*/POSTGRES_PORT=5432/" $REMOTE_APP_DIR/.env
mkdir -p $REMOTE_APP_DIR/.app
cp $REMOTE_APP_DIR/.env $REMOTE_APP_DIR/.app/.env
echo "Stopping any running containers"
docker-compose -f $REMOTE_APP_DIR/docker-compose.yml down
echo "Removing any existing images"
docker rmi webapp_web --force
docker rmi cos_data_and_technology_preso_webapp_app --force
docker rmi cos-data-and-technology-preso-webapp-app --force
docker rmi webapp_db --force
docker rmi cos_data_and_technology_preso_webapp_db --force
docker rmi cos-data-and-technology-preso-webapp-db --force
echo "Loading latest images"
docker load -i $REMOTE_APP_DIR/cos_data_and_technology_preso_webapp_app.tar
docker load -i $REMOTE_APP_DIR/cos_data_and_technology_preso_webapp_db.tar
echo "Build containers"
docker build -f $REMOTE_APP_DIR/App_Dockerfile --no-cache -t cos-data-and-technology-preso-webapp-app .
docker build -f $REMOTE_APP_DIR/DB_Dockerfile --no-cache -t cos-data-and-technology-preso-webapp-db .
echo "Starting the containers"
docker-compose -f $REMOTE_APP_DIR/docker-compose.yml up --force-recreate -d
echo "Cleaning up"
rm $REMOTE_APP_DIR/cos_data_and_technology_preso_webapp_app.tar
rm $REMOTE_APP_DIR/cos_data_and_technology_preso_webapp_db.tar
EOF

echo "Done @ $(date)"