FROM ubuntu:14.04

MAINTAINER Konstantin Shcherban version: 0.1

COPY script.sh /usr/bin/npm2deb

RUN chmod +x /usr/bin/npm2deb

RUN sed -i 's/archive/ru.archive/' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    debhelper \
    ruby \
    ruby-dev \
    dh-make \
    fakeroot \
    dpkg-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN gem install fpm

RUN curl https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz > /node-v0.12.7-linux-x64.tar.gz && \
    tar -C /usr --strip-components=1 -xzf /node-v0.12.7-linux-x64.tar.gz && \
    rm /node-v0.12.7-linux-x64.tar.gz

RUN locale-gen en_US.UTF-8

ENV USER=root LC_ALL=en_US.UTF-8
