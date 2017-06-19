FROM ubuntu:16.04

MAINTAINER Kevin Greene <kgreenek@gmail.com>

RUN apt-get update && \
    apt-get install -y git mercurial build-essential autoconf automake libtool pkg-config unzip \
        cmake ninja-build curl ruby-dev bison autopoint gettext && \
    apt-get clean

WORKDIR /root/build

ENTRYPOINT \
    cmake "/root/first_commit" -G Ninja -DFIRST_COMMIT_OUT_DIR="/root/out" \
        -DFIRST_COMMIT_EXTERNAL_DIR="/root/external" && \
    ninja
# TODO(kgreenek): Add tests and targets to install.
#    ninja test && \
#    ninja install
