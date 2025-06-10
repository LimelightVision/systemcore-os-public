FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    bc \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    make \
    libc6-dev \
    libncurses5-dev \
    rsync \
    cpio \
    wget \
    kmod \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create directories for toolchain and kernel
RUN mkdir -p /opt/systemcore-aarch64-toolchain /opt/systemcorelinux

# Set up environment variables
ENV ARCH=arm64
ENV CROSS_COMPILE=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-

RUN useradd -m -s /bin/bash builder && \
    chown -R builder:builder /opt/

# Set working directory
WORKDIR /workspace

# Default to bash shell
CMD ["/bin/bash"]