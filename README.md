# Apple Silicon Mac の dotfiles

zsh と Git の設定、Homebrew のアプリ一覧、Node.js、macOS の個人設定を管理します。

## 新しい Mac でセットアップ

Xcode Command Line Tools が未導入なら `xcode-select --install` を実行し、完了を待ちます。

```sh
git clone https://github.com/hk206/dotfiles.git
cd dotfiles
bash init.sh
```

`init.sh` はホーム直下の `.zshrc`、`.zprofile`、`.gitconfig`、`.gitignore` に、このリポジトリへのリンクを作ります。同じリンクはそのまま使い、既存のファイルや別のリンクがある場合は、リンクを作る前に停止します。セットアップ後は新しいターミナルを開きます。

既存の設定があると表示された場合は、そのファイルやリンクを別名で退避します。たとえば `~/.zshrc` なら、退避先が空いていることを確認して `mv -i ~/.zshrc ~/.zshrc.backup` を実行します。必要な個人設定をリポジトリ側に移してから `bash init.sh` を再実行してください。退避ファイルに認証情報がある場合は Git に追加せず、端末側に保存します。

## 管理しているもの

| ファイル | 役割 |
| --- | --- |
| `.zprofile`、`.zshrc` | ログイン時の PATH と対話用 zsh の設定 |
| `.gitconfig`、`.gitignore` | ユーザー共通の Git 設定と除外パターン |
| `homebrew/Brewfile` | 新しい Mac に入れる CLI とアプリの一覧。必要な項目に絞ってからセットアップする |
| `homebrew/setup.sh` | Homebrew の導入と、一覧にある未導入パッケージのインストール |
| `node/setup.sh` | nvm を初回導入し、Node.js 22・24・26 の各系列の最新版を取得する。既定は 26 |
| `ghostty/config` | Ghostty のテーマ、文字サイズ、キー操作。設定先は `${XDG_CONFIG_HOME:-$HOME/.config}/ghostty/config` |
| `starship.toml` | ディレクトリ、Git ブランチ、未コミットの変更を表示するプロンプト。設定先は `${XDG_CONFIG_HOME:-$HOME/.config}/starship.toml` |
| `mac/setup.sh` | Dock、Finder、スクリーンショット、入力などの個人設定 |
| `.github/workflows/main.yml` | macOS 上でシェルと Brewfile の構文を確認する CI の定義 |

ブラウザは Chrome を導入します。Bun と uv は Homebrew で導入します。開発用に ChatGPT、Codex CLI、Claude、Claude Code、Cursor、Ghostty も導入します。Ghostty の設定もリンクします。既存の設定がある場合は、上記の手順で退避してください。Starship も導入し、Git ブランチと未コミットの変更をプロンプトに表示します。

## Node.js の更新

既存の Mac では、このリポジトリで `bash node/setup.sh` を実行します。既存の nvm を使い、実行時点の各系列の最新版を取得します。反映には新しいターミナルを開きます。
