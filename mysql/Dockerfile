FROM mysql:5.7.22
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
    automake \
    autoconf \
    pkg-config \
    mysql-client \
    openssh-server \
    build-essential \
    libmysqlclient-dev \
    python3 \
    python3-pip

#gearman-mysql-udf
RUN apt-get    update                                                                             &&\
    apt-get -y upgrade                                                                            &&\
    apt-get -y dist-upgrade                                                                       &&\
    mkdir -p /usr/lib/mysql/plugin                                                                &&\
    apt-get -y install -y --no-install-recommends libgearman-dev                                    \
                                                  libmysqlclient-dev 

RUN wget https://github.com/mysqludf/lib_mysqludf_json/archive/master.zip                         &&\
    unzip master.zip                                                                              &&\
    cd lib_mysqludf_json-master/                                                                  &&\
    rm lib_mysqludf_json.so                                                                       &&\
    gcc $(mysql_config --cflags)-shared -fPIC -o lib_mysqludf_json.so lib_mysqludf_json.c         &&\
    cp lib_mysqludf_json.so /usr/lib/mysql/plugin/  

RUN wget https://launchpad.net/gearman-mysql-udf/trunk/0.6/+download/gearman-mysql-udf-0.6.tar.gz &&\
    tar -xzf gearman-mysql-udf-0.6.tar.gz                                                         &&\
    cd gearman-mysql-udf-0.6                                                                      &&\
    ./configure --with-mysql=/usr/bin/mysql_config --libdir=/usr/lib/mysql/plugin/                &&\ 
    make                                                                                          &&\
    make install

COPY ./wait-for-it.sh /wait-for-it.sh
