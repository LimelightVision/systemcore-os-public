#!/bin/bash

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
        echo "Building C++ project..."
        docker-compose run --rm crosscompile ./crosscompile.sh
        ;;
    
    clean)
        echo "Cleaning C++ project..."
        docker-compose run --rm crosscompile rm -rf build
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
        echo "Usage: $0 {setup|build|clean|shell|down}"
        exit 1
        ;;
esac