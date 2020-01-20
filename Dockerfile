FROM centos:latest

RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install \ 
           kernel-devel \
           kernel-headers \
           gcc-c++ \
           patch \
           libyaml-devel \
           libffi-devel \
           autoconf \
           automake \
           make \
           libtool \
           bison \
           tk-devel \
           zip \
           wget \
           tar \
           gcc \
           zlib \
           zlib-devel \
           bzip2 \
           bzip2-devel \
           readline \
           readline-devel \
           sqlite \
           sqlite-devel \
           openssl \
           openssl-devel \
           git \
           gdbm-devel \
           python-devel

# pythonをインストール
WORKDIR /root
RUN wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
RUN tar xzvf Python-3.7.3.tgz

WORKDIR ./Python-3.7.3
RUN ./configure --with-threads
RUN make install

# pipをinstall
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py


RUN alias python='python3'

RUN pip install apache-airflow

WORKDIR /root
EXPOSE 8080

ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]