FROM golang:1.21-bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && apt-get install -y \
    build-essential \
    file \
    rsync \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create toolchain directory
RUN mkdir -p /opt/systemcore-aarch64-toolchain

# Set up cross-compilation environment variables
ENV GOOS=linux
ENV GOARCH=arm64
ENV CGO_ENABLED=0
# Maybe we just shouldn't use the toolchain. 
# ENV CGO_ENABLED=1
# ENV CC=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-gcc
# ENV CXX=/opt/systemcore-aarch64-toolchain/bin/aarch64-buildroot-linux-gnu-g++

# Create user with same UID/GID as host
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN if [ "${USER_ID}" != "0" ]; then \
        groupadd -g ${GROUP_ID} builder && \
        useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /bin/bash builder && \
        chown -R builder:builder /go; \
    fi

# Only switch to non-root user if USER_ID is not 0
USER ${USER_ID}
WORKDIR /workspace

CMD ["/bin/bash"]