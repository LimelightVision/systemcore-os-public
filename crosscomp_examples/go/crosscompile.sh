#!/bin/sh

set -e

echo "Cross-compiling Go for Systemcore"

export GOOS=linux
export GOARCH=arm64

# export CGO_ENABLED=1
# export CC=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-gcc
# export CXX=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-g++

#  (no C deps), CGO is disabled, jsut use built-in go cross comp
export CGO_ENABLED=0

rm -f gosystemcore

echo "Building for ${GOOS}/${GOARCH}..."
go build -v -o gosystemcore .

echo "Build complete. Binary: gosystemcore"
echo "File info:"
file gosystemcore || echo "file command not available"