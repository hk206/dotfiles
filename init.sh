# リポジトリの場所を基準に、ホームへのリンクを作成して各セットアップを実行する。
THIS_DIR=$(cd "$(dirname "$0")" && pwd) || exit 1

dotfiles=(.zshrc .zprofile .gitconfig .gitignore ghostty/config starship.toml)

# Ghostty と Starship は XDG_CONFIG_HOME を使い、未指定なら ~/.config を使う。
dotfile_target() {
    case "$1" in
        ghostty/config) printf '%s/ghostty/config\n' "${XDG_CONFIG_HOME:-$HOME/.config}" ;;
        starship.toml) printf '%s/starship.toml\n' "${XDG_CONFIG_HOME:-$HOME/.config}" ;;
        *) printf '%s/%s\n' "$HOME" "$1" ;;
    esac
}

# 既存の設定を保護するため、すべてのリンク先を先に確認する。
for dotfile in "${dotfiles[@]}"; do
    target=$(dotfile_target "$dotfile")
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$THIS_DIR/$dotfile" ]; then
        continue
    fi
    if [ -e "$target" ] || [ -L "$target" ]; then
        printf '既存の設定があるため中止しました: %s\n' "$target" >&2
        exit 1
    fi
done

for dotfile in "${dotfiles[@]}"; do
    target=$(dotfile_target "$dotfile")
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$THIS_DIR/$dotfile" ]; then
        continue
    fi
    mkdir -p "$(dirname "$target")" || exit 1
    ln -snv "$THIS_DIR/$dotfile" "$target" || exit 1
done

# Homebrew
(cd "$THIS_DIR/homebrew" && bash setup.sh) || exit 1

# Node.js
bash "$THIS_DIR/node/setup.sh" || exit 1

# Mac Setup
bash "$THIS_DIR/mac/setup.sh"
