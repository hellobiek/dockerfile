FROM ubuntu:16.04
MAINTAINER Biek "hellobiek@gmail.com"

ENV LANG C.UTF-8

#init sys requires
RUN apt-get    update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install -y --no-install-recommends apt-utils \
    iputils-ping \
    telnet \
    net-tools \
    git \
    vim \
    unzip \
    g++ \
    rpm \
    wget \
    make \
    htop \
    sudo \
    netcat \
    automake \
    autoconf \
    pkg-config \
    python-dev \
    python3-dev \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    mysql-client \
    libmysqld-dev \
    openssh-server \
    build-essential \
    python3 \
    python3-pip \
    python3-bs4 \
    python3-dev \
    python3-yaml \
    python3-lxml \
    python3-wheel \
    python3-scipy \
    python3-numpy \
    python3-gevent \
    python3-pandas \
    python3-requests \
    python3-html5lib \
    python3-setuptools \
    python3-matplotlib

RUN pip3 install git+https://github.com/bbrodriges/gear.git#egg=gear
RUN pip3 install protobuf leancloud SQLAlchemy mysqlclient beautifulsoup4 mysql-connector-python Pillow pytdx numexpr xlrd redis

COPY ./wait-for-it.sh /wait-for-it.sh
