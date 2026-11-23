#!/usr/bin/env bash
# nvm を初回導入し、指定した各系列の最新 Node.js を取得する。
set -eo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
nvm_repo=https://github.com/nvm-sh/nvm.git

if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
    latest_tag=$(
        git ls-remote --tags --refs --sort=-version:refname "$nvm_repo" |
            awk '$2 ~ /^refs\/tags\/v[0-9]+\.[0-9]+\.[0-9]+$/ && !found {
                sub(/^refs\/tags\//, "", $2)
                print $2
                found = 1
            }'
    )
    if [[ -z "$latest_tag" ]]; then
        echo "Could not determine the latest stable nvm release." >&2
        exit 1
    fi
    git clone --depth 1 --branch "$latest_tag" "$nvm_repo" "$NVM_DIR"
fi

. "$NVM_DIR/nvm.sh" --no-use
for major in 22 24 26; do
    nvm install "$major"
done
nvm alias default 26
