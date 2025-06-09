#!/usr/bin/env bash

apt-get update && apt-get install -y apt-utils gnupg2

apt-get update && apt-get install -y --no-install-recommends \
    zlib1g-dev libicu-dev git nano zip unzip pngquant default-mysql-client libmagickwand-dev \
    libzip-dev \
    python3-setuptools \
    python3-pygments \
    libgmp-dev \
    ;

apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

curl -L -o /tmp/cavif.deb https://github.com/kornelski/cavif-rs/releases/download/v1.5.6/cavif_1.5.6-1_amd64.deb \
    && dpkg -i /tmp/cavif.deb \
    && rm /tmp/cavif.deb
