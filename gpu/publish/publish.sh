#!/bin/bash

REMOTE_APP_DIR="~/apps/open-source-success-presentation/gpu"
SCP_TARGET=jason@3.tcp.ngrok.io
SCP_PORT=26049

# Send the tar files to the remote server using scp
echo "Sending files to $SCP_TARGET:$SCP_PORT"
scp -P $SCP_PORT $ENV_FILE ./publish/images/*.tar ./publish/Dockerfile ./publish/docker-compose.yml ./publish/clear-docker.sh $SCP_TARGET:$REMOTE_APP_DIR

# Login to the remote server to load the images
# For some reason new version of docker save with dashes in the name even
# if the image uses underscores. So we just delete and remove both versions below.
# You can run docker image -ls on the remote server to confirm the image names.
# there should be 4 images, 2 for the app and 2 for the db
echo "Logging into $SCP_TARGET:$SCP_PORT"
ssh -p $SCP_PORT $SCP_TARGET << EOF
echo "Stopping any running containers"
docker-compose -f $REMOTE_APP_DIR/docker-compose.yml down
echo "Removing any existing images"
docker rmi webapp_web --force
docker rmi open_source_success_gpu_app --force
docker rmi open-source-success-gpu-app --force
echo "Loading latest images"
docker load -i $REMOTE_APP_DIR/open_source_success_gpu_app.tar
echo "Build containers"
docker build -f $REMOTE_APP_DIR/Dockerfile --no-cache -t open-source-success-gpu-app .
echo "Starting the containers"
docker-compose -f $REMOTE_APP_DIR/docker-compose.yml up --force-recreate -d
echo "Cleaning up"
rm $REMOTE_APP_DIR/open_source_success_gpu_app.tar
echo "Make clear-docker.sh executable"
chmod +x $REMOTE_APP_DIR/clear-docker.sh
EOF

echo "Done @ $(date)"