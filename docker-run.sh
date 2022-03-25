#!/usr/bin/env bash

if docker container ls -a -f name=nextcloud_dev | grep -q nextcloud_dev; then
    echo 'Starting existing container...'
    docker start -i nextcloud_dev
    exit
fi

echo 'Starting new container...'

docker run \
    -i \
    --name=nextcloud_dev \
    -p 8080:80 \
    -t \
    -v "$PWD/server:/var/www/html" \
    -v "$PWD/config:/var/www/html/config" \
    -v "$PWD/custom_apps:/var/www/html/custom_apps" \
    -v "$PWD/data:/var/www/html/data" \
    nextcloud_dev

