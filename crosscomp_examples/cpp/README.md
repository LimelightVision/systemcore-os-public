CROSS-COMPILING WITHOUT DOCKER

* Requires a host x86 machine with glibc 2.38
* Extract systemcorelinux to /opt
* Extract the toolchain to /opt
* ./relocate-sdk.sh inside the toolchain dir
* ./crosscompile.sh

CROSS-COMPILING WITH DOCKER

* apt install docker
* apt install docker-compose
* Extract systemcorelinux to /opt
* Extract the toolchain to /opt
* ./relocate-sdk.sh inside the toolchain dir
* ./docker-build.sh setup
* ./docker-build.sh build
