FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    bc \
    bison \
    flex \
    libssl-dev \
    make \
    lld \
    llvm \
    clang \
    curl \
    git \
    cpio \
    xz-utils \
    dwarves \
    python3 \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/toolchain && \
    curl -L https://github.com/kdrag0n/proton-clang/archive/refs/tags/master.tar.gz | tar -xz -C /opt/toolchain --strip-components=1

ENV PATH="/opt/toolchain/bin:${PATH}"
ENV ARCH=arm64
ENV SUBARCH=arm64
ENV CC=clang
ENV LLVM=1
ENV LLVM_IAS=1
ENV CROSS_COMPILE=aarch64-linux-gnu-
ENV CROSS_COMPILE_COMPAT=arm-linux-gnueabi-

WORKDIR /workspace
