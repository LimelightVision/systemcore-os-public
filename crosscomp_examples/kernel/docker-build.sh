#!/bin/bash

# 1. Setup container
# ./docker-build.sh setup 
# 2. Build
# docker-build.sh build

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

COMMAND=${1:-build}

case ${COMMAND} in
    setup)
        echo "Building Docker Img"
        USER_ID=$(id -u) GROUP_ID=$(id -g) docker-compose build
        echo "Docker image built successfully!"
        ;;
    
    build)
        echo "Building kernel module..."
        docker-compose run --rm crosscompile ./build-in-container.sh modules
        ;;
    
    clean)
        echo "Cleaning kernel module..."
        docker-compose run --rm crosscompile ./build-in-container.sh clean
        ;;
    
    shell)
        echo "Starting interactive shell..."
        docker-compose run --rm crosscompile /bin/bash
        ;;
    
    down)
        echo "Removing containers..."
        docker-compose down
        ;;
    
    *)

        exit 1
        ;;
esac