#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget m4 cmake && \
  rm -rf /var/lib/apt/lists/*

RUN \
  [ -f /source/Makefile ] \
  && echo "Found Volume Source" \
  || git clone https://github.com/qca/open-ath9k-htc-firmware.git && \
  mv ./open-ath9k-htc-firmware /source

RUN \
  cd /source && \
  make toolchain

RUN \
  cd /source && \
  make -C target_firmware
