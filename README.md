# README
## 概要
ほしのなか政府広報サイトのリポジトリです。

## バージョン
- Ruby: 3.2.2
- Rails: 7.0.8
- MySQL: 8.0.35

## コンテナの起動
1. `git clone https://github.com/Snak0201/fpb-wwwsite.git`でクローンを行います
1. 以下のファイルを提供してもらい、以下のディレクトリに配置します
    - development.key -> config/credentials
    - production.key -> config/credentials
    - id_rsa -> ~/.ssh/fpb-wwwsite_conoha
1. `docker compose build`でコンテナをビルドします
1. `docker compose run --rm app rails db:create`でローカルにデータベースを作成します
1. `docker compose up`で起動します
1. `localhost:8000`で画面を確認できます

## 本番環境へのデプロイ（リリース）方法
1. 対象のコードをmainブランチに反映します
1. GitHub上でReleaseを作成します。バージョンは以下に従ってつけることとします。
    - 後方互換性がない場合、メジャーバージョンを上げます
    - 後方互換性があり、機能の追加を行う場合、マイナーバージョンを上げます
    - 後方互換性があり、バグの修正や軽微な変更を行う場合、パッチバージョンを上げます
    - 動作確認等でプレリリースを行う場合、プレリリースバージョンをX.Y.z-pre.1のようにつけ、その後はプレリリースを行うたびにプレリリースバージョンを上げます。正式リリース時にはプレリリースバージョンは取り除きます。
1. ローカルで`docker compose run --rm app bundle exec cap production deploy`を実行します
1. （プレリリースの場合）動作確認後、`docker compose run --rm app bundle exec cap production deploy:rollback`でロールバックを行います
