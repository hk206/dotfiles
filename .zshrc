# 対話用 zsh の履歴と、各ツールの初期化を設定する。
# history
setopt share_history
setopt inc_append_history
setopt hist_save_no_dups
setopt hist_reduce_blanks

export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Homebrew 版などが PATH にない場合は、ユーザー領域に入れた Bun を使う。
if ! command -v bun >/dev/null 2>&1 && [ -x "$HOME/.bun/bin/bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
