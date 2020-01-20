# Airflow handson

## 事前準備

### Mac OS X user の場合

1. python3系がインストールされていることを確認

- terminalでバージョン確認
```
host@name $ python -V
```
> Python 3.6.1

※ 3系が入っていない場合は以下のサイトなどを参考に導入してください！
- [MacのPythonを2系から3系にアップデートする](https://qiita.com/Ajyarimochi/items/ff40e57d082dd171e761)


2. 'apache-airflow'をinstall

- terminalで以下のコマンド実行
```
host@name $ pip install apache-airflow
```

3. 適当なディレクトリを用意して移動
```
host@name $ mkdir airflow_sample; cd $_
```

4. Airflowのためのデータベースを作成する

- 練習用に、Defaultの`SQLite`データベースを作成する
- 先ほど作ったディレクトリで、以下のコマンドを実行
```
host@name $ airflow initdb
```

5. schedulerを起動

- terminalで以下のコマンドを実行
```
host@name $ airflow scheduler
```

6. webserverを起動

- 5.とは別のterminalを開いて以下のコマンドを実行
```
host@name $ airflow webserver -p 8080
```

7. ブラウザで`airflow/admin`にアクセス

> localhost:8080

- 管理画面がみられれば完了


### Windows user の場合

- AirflowはLinux、Mac OS Xでのみ動作するため、仮想環境の中で実行する必要がある

#### dockerでやる場合

1. Linux(CentOS)にPythonを入れた環境を用意

- 以下のDockerfileを用意してさっき作ったディレクトリに置く

```Dockerfile
# OS:CentOS
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
```

2. imageをbuildする

- terminalで以下のコマンドを実行
```
host@name $ docker build -t centos .
```

3. CentOSのコンテナを起動してshellに入る

- terminalで以下のコマンドを実行
```
host@name $ docker run -p 8080:8080 -v /c/Users/<name>/<path-to-folder>/airflow_sample:/root --name airflow-handson 
```

- kitematicとかから↑のコンテナに入る
```
host@name $ docker exec -it <container-id> bash
sh
```

4. あとはMac OS X の場合の`4.`と一緒