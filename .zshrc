# 対話用 zsh の履歴と、各ツールの初期化を設定する。
# history
setopt share_history
setopt inc_append_history
setopt hist_save_no_dups
setopt hist_reduce_blanks

export PATH="$HOME/.local/bin:$PATH"

# zsh 標準の Tab 補完を初期化し、Homebrew の補完定義も読み込む。
_dotfiles_brew_share="${HOMEBREW_PREFIX:-/opt/homebrew}/share"
if [[ -d "$_dotfiles_brew_share/zsh-completions" ]]; then
    fpath=("$_dotfiles_brew_share/zsh-completions" "${fpath[@]}")
fi
autoload -Uz compinit
# 書き込み権限が安全でない補完定義はスキップする。
compinit -i

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

# 入力中のコマンドに履歴から続きを提案する。
if [[ -r "$_dotfiles_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$_dotfiles_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
unset _dotfiles_brew_share

# 現在のディレクトリと Git の状態をプロンプトに表示する。
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
