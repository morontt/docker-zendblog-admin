#!/usr/bin/env bash

apt-get update && apt-get install -y apt-utils gnupg2

apt-get update && apt-get install -y --no-install-recommends \
    zlib1g-dev libicu-dev git nano zip unzip pngquant default-mysql-client libmagickwand-dev \
    libzip-dev \
    python3-setuptools \
    python3-pygments \
    ;

apt-get clean

rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
