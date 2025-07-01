#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

COMMAND=${1:-build}

case ${COMMAND} in
    setup)
        echo "Building Go Docker image..."
        USER_ID=$(id -u) GROUP_ID=$(id -g) docker-compose build
        echo "Docker image built successfully!"
        ;;
    
    build)
        echo "Building Go project..."
        docker-compose run --rm crosscompile ./crosscompile.sh
        ;;
    
    clean)
        echo "Cleaning Go project..."
        docker-compose run --rm crosscompile rm -f gosystemcore
        ;;
    
    test)
        echo "Testing Go build..."
        docker-compose run --rm crosscompile go version
        docker-compose run --rm crosscompile go env GOOS GOARCH
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
        echo "Usage: $0 {setup|build|clean|test|shell|down}"
        exit 1
        ;;
esac