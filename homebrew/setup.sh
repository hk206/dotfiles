# Homebrew
if !(type "brew" >/dev/null 2>&1); then
    echo "installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# パッケージ情報を更新し、Brewfile にある未導入のアプリと CLI を入れる。
brew update && brew bundle --no-upgrade
