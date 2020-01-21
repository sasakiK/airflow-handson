---
marp: true
theme: base
description: Airflow Hands-on slide
paginate: true
footer: ...
---

<!-- size: 16:9 -->

<style>
    @font-face
    {
        font-family: monaco;
        src: url('./assets/fonts/monaco.ttf')
    }
    section {
        background:#282828;
        color:#E3A06A;
        font-family: 'monaco' 'Monaco';
        justify-content: flex-start;
    }
    h1 {
        position: relative;
        color: #E3A06A;
    }
    h2 {
        margin-top: 0;
    }
    h5 {
        background: #333333;
        color: #FFFFFF;
        text-align: center;
        padding: 5px 0px 5px 0px;
        width: 40%;
    }
    p{ color:#E3A06A;}
    li {list-style-type: none;}
    li:before {
        content: '';
        width: 6px;
        height: 6px;
        display: inline-block;
        border-radius: 100%;
        background: #E3A06A;
        position: relative;
        left: -15px;
        top: -5px;
    }
    pre {color: #E3A06A;}
    footer {color: #E3A06A;}

</style>

<style scoped>
    section {
        justify-content: center;
    }
    p{
        text-align: right;
        margin-top: 10%;
        font-size: 18px;
    }
</style>

<!-- <style>
    @font-face
    {
        font-family: monaco;
        src: url('./assets/fonts/monaco.ttf')
    }
    section {
        background:#282828;
        color:#BDC3C9;
        font-family: 'monaco' 'Monaco';
        justify-content: flex-start;
    }
    h1 {
        position: relative;
        color: #BDC3C9;
    }
    h2 {
        margin-top: 0;
    }
    h5 {
        background: #333333;
        color: #FFFFFF;
        text-align: center;
        padding: 5px 0px 5px 0px;
        width: 40%;
    }
    p{ color:#BDC3C9;}
    li {list-style-type: none;}
    li:before {
        content: '';
        width: 6px;
        height: 6px;
        display: inline-block;
        border-radius: 100%;
        background: #BDC3C9;
        position: relative;
        left: -15px;
        top: -5px;
    }
    pre {color: #BDC3C9;}
    footer {color: #BDC3C9;}

</style>

<style scoped>
    section {
        justify-content: center;
    }
    p{
        text-align: right;
        margin-top: 10%;
        font-size: 18px;
    }
</style> -->

# Airflow Handson

- Airflowとは
- 簡単な例
- クラウドサービス上で実装してみる
- 応用例

2020.01.24


---

<style scoped>
    h1 {
        text-align: center;
        font-size: 70px;
        height: 100%;
        padding-top: 20%;
    }
</style>

# Airflowとは

---

<style scoped>
    h1 { color: white; }
    h6 { text-align: center; margin-top:0; }
    li, ul { color: white; }
    pre {color: #E3A06A;}
    li {list-style-type: none;}
    li:before { background: white; }
</style>

# Airflowとは

![bg](./assets/images/top-bl.png)

- ↓ みたいなやつが作れるやつ

###### ![height:250px width:100%](./assets/images/top.png)

- ワークフロー(データの取得・クリーニング・前処理、モデリング、スクレイピングなどの処理)を管理したり、スケジュールしたりするためのフレームワーク
- 2014年10月に、`Airbnb`の`Maxime Beauchemin`によって始まったOSSプロジェクトで、2019年1月に`Apache Airflow`になった

---



---