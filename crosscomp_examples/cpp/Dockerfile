FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    make \
    libc6-dev \
    rsync \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/systemcore-aarch64-toolchain

ENV ARCH=arm64
ENV CROSS_COMPILE=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-

RUN useradd -m -s /bin/bash builder && \
    chown -R builder:builder /opt/

WORKDIR /workspace

CMD ["/bin/bash"]