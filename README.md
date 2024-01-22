# PalDocker

## Usage
PalworldのサーバーをDocker上で稼働させます。
リポジトリをclone後に
```
docker compose up
```
を実行することで起動できます。

## Configure
`PalWorldSettings.ini`を編集することでサーバー設定を変更できます。変更の反映には再起動が必要です。

環境変数で一部設定を行えます。
- `MULTITHREAD` - `true`の場合マルチスレッディングを有効にします。
- `PLAYERS` - 設定した数値をサーバーの最大人数に設定します。
- `PUBLIC_SERVER` - `true`の場合コミュニティサーバーとして起動します。
- `PUBLIC_IP` - サーバーグローバルIPアドレスを指定値で上書きします。動作内容を理解しているときのみコメントアウトしてください。
- `PUBLIC_PORT` - サーバーポートを指定値で上書きします。動作内容を理解しているときのみコメントアウトしてください。

## Issues
- Windows環境で実行した際に`exec ./entrypoint.sh: no such file or directory`が出る場合があるようです。StackOverflowに改行コードを`CRLF`から`LF`にしたら直ったみたいな話（[該当ページへのリンク](https://stackoverflow.com/questions/44460825/entrypoint-file-not-found#answers-header)）があるので試してみてください。