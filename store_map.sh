#!/bin/bash

docker-compose -f ./scripts/docker-compose_store_map.yml up -d

cleanup() {
    echo "Shutting down docker-compose services..."
    docker ps -aq --filter "name=pros_app*" | xargs docker rm -f
    exit 0
}

trap cleanup SIGINT

echo "Press Ctrl+C to stop..."

echo "Listening to docker-compose_store_map.yml logs. Press Ctrl+C to stop..."
docker-compose -f ./scripts/docker-compose_store_map.yml logs -f &
wait
