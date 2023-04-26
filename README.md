# dotfiles(for AppleSilicon MacBook)

## セットアップ

- AppStore にサインイン
- 以下のコードをターミナルで実行

```sh
cd $HOME
xcode-select --install
git clone https://github.com/hk206/dotfiles.git
cd dotfiles
./init.sh
```

- Mac を再起動

## その他手動で行う設定

### システム環境設定
適宜手動で設定する必要あり。OS変更で手順が変わったため、後ほど書き直します。

### Finder

- よく使う項目にホームディレクトリを追加

### Google Chrome

- 初回起動時、デフォルトブラウザを chrome に設定
- Google アカウントで同期する

### 1Password

- 環境設定 > 詳細設定 > Spotlight を有効にして、サードパーティアプリを統合を on にする

### VSCode

- GitHub アカウントで認可

### AWS

- aws configure コマンドで認証情報の設定を行う
