#!/bin/bash
# Runs inside the Docker container

set -e

ARCH=${ARCH:-arm64}
CROSS_COMPILE=${CROSS_COMPILE:-/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-}
KDIR=${KDIR:-/opt/systemcorelinux}
MODULE_DIR=${MODULE_DIR:-/workspace}
TARGET=${1:-modules}

echo "=== Build Environment ==="
echo "Arch:          ${ARCH}"
echo "Cross Compile: ${CROSS_COMPILE}"
echo "Kernel Dir:    ${KDIR}"
echo "Module Dir:    ${MODULE_DIR}"
echo "Target:        ${TARGET}"
echo "========================"

# Check if cross compiler exists and is executable
if [ -f "${CROSS_COMPILE}gcc" ]; then
    echo "Cross compiler found at: ${CROSS_COMPILE}gcc"
    ${CROSS_COMPILE}gcc --version 2>/dev/null || echo "Note: Cannot run version check (expected in container)"
else
    echo "ERROR: Cross compiler not found at: ${CROSS_COMPILE}gcc"
    echo "Available files in toolchain bin:"
    ls -la $(dirname ${CROSS_COMPILE}) 2>/dev/null || echo "Toolchain directory not found"
    exit 1
fi

# Check if kernel directory exists
if [ ! -d "${KDIR}" ]; then
    echo "ERROR: Kernel directory not found at: ${KDIR}"
    exit 1
fi

# Run the build
echo
echo "Starting build..."
make -C "${KDIR}" M="${MODULE_DIR}" ARCH="${ARCH}" CROSS_COMPILE="${CROSS_COMPILE}" ${TARGET}

echo
echo "Build completed successfully!"