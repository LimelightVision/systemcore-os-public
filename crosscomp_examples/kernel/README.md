CROSS-COMPILING WITHOUT DOCKER

* Requires a host x86 machine with glibc 2.38
* Extract systemcorelinux to /opt
* Extract the toolchain to /opt
* Run ./relocate-sdk.sh inside the toolchain dir
* sh crosscompile.sh

CROSS-COMPILING WITH DOCKER

* Extract systemcorelinux to /opt
* Extract the toolchain to /opt
* Run ./relocate-sdk.sh inside the toolchain dir
* Run ./docker-build.sh setup
* Run ./docker-build.sh build
