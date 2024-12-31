# README
## 概要
ほしのなか政府広報サイトのリポジトリです。

## バージョン
- Ruby: 3.3.1
- Rails: 7.2.2
- MySQL: 8.0.35

## コンテナの起動方法
1. `git clone https://github.com/Snak0201/fpb-wwwsite.git`でクローンを行います
1. 以下のファイルを提供してもらい、以下のディレクトリに配置します
    - development.key -> config/credentials
    - production.key -> config/credentials
    - test.key -> config/credentials
    - id_rsa -> ~/.ssh/conoha_fpb-wwwsite
1. `docker compose build`でコンテナをビルドします
1. `docker compose run --rm app rails db:create`でローカルにデータベースを作成します
1. `docker compose up`で起動します
1. `localhost:8000`で画面を確認できます

## Rubocopによるコード修正方法
`rubocop -A`

※修正する必要がない場合、`rubocop -A --disable-uncorrectable`を実行します。

## Slimcopによるコード検査方法
`slimcop`

※ `-a`オプションで自動修正できますが、変な修正になることもあります。

## RSpecによるテスト方法
`rspec`を実行します。

## 本番環境へのデプロイ（リリース）方法
1. 対象のコードをmainブランチに反映します（プルリクエストが**必須**です）
1. GitHub上でReleaseを作成します。バージョンは[Wiki](https://github.com/Snak0201/fpb-wwwsite/wiki/%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E3%81%AE%E4%BB%98%E3%81%91%E6%96%B9#%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%8B%E3%83%B3%E3%82%B0%E3%81%AE%E4%BB%95%E6%96%B9)に従って作成します。
1. ローカルで`docker compose run --rm app bundle exec cap production deploy`を実行します
1. 軽く動作確認を行います
1. （不具合が起きた場合）動作確認後、`docker compose run --rm app bundle exec cap production deploy:rollback`でロールバックを行います

## 本番環境のコンソールへのアクセス方法
`docker compose run --rm app bundle exec cap production rails:console`を実行します

※ WARNING: UNPROTECTED PRIVATE KEY FILE!が出る場合、`docker compose run --rm app chmod 600 /root/.ssh/conoha_fpb-wwwsite/id_rsa`を実行します

## 追加機能が反映されていないとき
unicornがエラーを起こしている可能性があります。以下の手順で確認してください。
1. サーバーの`current/log/unicorn.log`を確認する
1. 異常があれば`unicorn:restart`をする。([参考](https://naka-no-mura.hateblo.jp/entry/gemfile_not_found))
