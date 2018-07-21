FROM ubuntu:16.04
MAINTAINER Biek "hellobiek@gmail.com"

ENV LANG C.UTF-8

#init sys requires
RUN apt-get    update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install -y --no-install-recommends apt-utils \
    vim \
    g++ \
    make \
    sudo \
    automake \
    autoconf \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    mysql-client \
    libmysqld-dev \
    openssh-server \
    build-essential 

COPY ./wait-for-it.sh /wait-for-it.sh
COPY ./setup.sh /run/setup.sh 
