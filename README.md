# Airflow handson

## 事前準備

### Mac OS X user の場合

1. python3系がインストールされていることを確認

- terminalでバージョン確認
```
$ python -V
```
> Python 3.6.1

※ 3系が入っていない場合は以下のサイトなどを参考に導入してください！
- [MacのPythonを2系から3系にアップデートする](https://qiita.com/Ajyarimochi/items/ff40e57d082dd171e761)


2. 'apache-airflow'をinstall

- terminalで以下のコマンド実行
```
$ pip install apache-airflow
```

3. 適当なディレクトリを用意して移動
```
$ mkdir airflow_sample; cd $_
```

4. Airflowのためのデータベースを作成する

- 練習用に、Defaultの`SQLite`データベースを作成する
- 先ほど作ったディレクトリで、以下のコマンドを実行
```
$ airflow initdb
```

5. schedulerを起動

- terminalで以下のコマンドを実行
```
$ airflow scheduler
```

6. webserverを起動

- 5.とは別のterminalを開いて以下のコマンドを実行
```
$ airflow webserver -p 8080
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
# https://github.com/sasakiK/airflow-handson/blob/master/Dockerfile
```

2. imageをbuildする

- terminalで以下のコマンドを実行
```
$ docker build -t centos .
```

3. CentOSのコンテナを起動してshellに入る

- terminalで以下のコマンドを実行
```
$ docker run -p 8080:8080 -v /c/Users/<name>/<path-to-folder>/airflow_sample:/root --name airflow-handson 
```

- kitematicとかから↑のコンテナに入る
```
$ docker exec -it <container-id> bash
sh
```

4. あとはMac OS X の場合の`4.`と一緒