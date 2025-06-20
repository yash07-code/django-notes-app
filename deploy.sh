#!/bin/bash

set -e  # Exit on any error

echo "Deploying application..."

# Pull the latest Docker image
docker pull yashsuryawanshi07/node-todo:latest

# Check if the container is already running
if [ "$(docker ps -q -f name=node-todo)" ]; then
    echo "Stopping and removing existing container..."
    docker stop node-todo
    docker rm node-todo
elif [ "$(docker ps -aq -f name=node-todo)" ]; then
    echo "Removing previously stopped container..."
    docker rm node-todo
else
    echo "No existing container found. Proceeding with deployment..."
fi

# Run the updated container with auto-restart
echo "Starting new container..."
docker run -d --name node-todo -p 8000:8000 --restart unless-stopped yashsuryawanshi07/node-todo:latest

echo "Deployment completed successfully!"
