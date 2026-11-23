# Homebrew が導入済みなら、既存の PATH に Homebrew のパスを追加する。
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
