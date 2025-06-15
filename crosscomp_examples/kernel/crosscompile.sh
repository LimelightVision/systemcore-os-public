#!/bin/sh

# Assumes toolchain has been extracted to (/opt/host...)
# Assumes kernel source has been extracted (/opt/systemcorelinux...)

set -e

export ARCH=arm64

# Cross compiler prefix
export CROSS_COMPILE="/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-"

# Kernel build directory (with kbuild).
KDIR="/opt/systemcorelinux"
MODULE_DIR=$(pwd)
TARGET="modules"

if [ "$1" = "clean" ]; then
  TARGET="clean"
  echo "INFO: Target is set to CLEAN."
fi

echo "Arch:          ${ARCH}"
echo "Cross Comp:    ${CROSS_COMPILE}"
echo "Kernel Dir:    ${KDIR}"
echo "Src Dir:       ${MODULE_DIR}"
echo "Target:        ${TARGET}"

make -C "${KDIR}" M="${MODULE_DIR}" ${TARGET}

echo
echo "Operation '${TARGET}' finished successfully."