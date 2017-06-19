FROM ubuntu:16.04

MAINTAINER Kevin Greene <kgreenek@gmail.com>

RUN apt-get update && \
    apt-get install -y git mercurial build-essential cmake ninja-build && \
    apt-get clean

WORKDIR /root/build

ENTRYPOINT \
    cmake "/root/first_commit" -G Ninja -DFIRST_COMMIT_OUT_DIR="/root/out" \
        -DFIRST_COMMIT_EXTERNAL_DIR="/root/external" && \
    ninja && \
    ninja test && \
    ninja install
