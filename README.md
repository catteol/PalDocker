# PalDocker

## Usage
PalworldのサーバーをDocker上で稼働させます。
リポジトリをclone後に
```
docker compose up
```
を実行することで起動できます。

## Configure
環境変数で一部設定を行えます。
`MULTITHREAD` - `true`にした場合マルチスレッディングを有効にします。
`PLAYERS` - 設定した数値をサーバーの最大人数に設定します。

## ToDo
- サーバー設定ファイルの読み込みとか