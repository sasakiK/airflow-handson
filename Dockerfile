# CentOS7
FROM centos:centos7

## install util
RUN yum -y update \
 && yum -y install \
    epel-release \
    gcc \
    git \
    vim \
    which \
 && yum clean all

# https://www.python.jp/install/centos/index.html
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y \
    python36u \
    python36u-devel \
    python36u-pip \
 && yum clean all \
 && ln -sf /usr/bin/python3.6 /usr/bin/python3 \
 && ln -sf /usr/bin/pip3.6 /usr/bin/pip3 \
 && pip3 install --upgrade pip

# locale & timezone 
RUN yum reinstall -y glibc-common \
 && yum clean all
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
 && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && echo 'KEYMAP="jp106"' > /etc/vconsole.conf

# setting
RUN echo 'alias ll="ls -laF --color=auto"' >> /root/.bashrc \
 && echo 'export PS1="[\u@\h \w]\$ "' >> /root/.bashrc

# install airflow
RUN pip install apache-airflow

WORKDIR /root
EXPOSE 8080

ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]