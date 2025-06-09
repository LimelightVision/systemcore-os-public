#!/bin/sh
mkdir -p build
cd build
rm -rf *
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../cross.cmake
make -j20
