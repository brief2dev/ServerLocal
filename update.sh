#!/bin/bash

set -e

echo "Actualizando servicios Docker..."

BASE_DIR=$(pwd)
DOCKER_DIR="$BASE_DIR/docker"

for dir in $(find $DOCKER_DIR -name "docker-compose.yml" -exec dirname {} \;); do
    echo "Actualizando: $dir"
    cd "$dir"
    docker compose pull
    docker compose up -d
done

cd $BASE_DIR

echo ""
echo "Servicios actualizados"
docker ps