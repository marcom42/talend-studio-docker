#!/bin/sh

echo "Looking for container $1..."

IMAGE_ID=$(docker container ls --all | grep $1 | awk '{print $1}')

if [ -n "$IMAGE_ID" ]; then
	echo "Container $1 found! Image id: $IMAGE_ID"
	sudo docker commit $IMAGE_ID $1
	echo "Changes have been committed."
else 
	echo "Container not found! Aborting commit."
fi
