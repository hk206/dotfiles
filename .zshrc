# path
export PATH="$HOME:${PATH}"
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# alias
[ -f ~/.alias.zsh ] && source ~/.alias.zsh

# history
setopt share_history
setopt inc_append_history
setopt hist_save_no_dups
setopt hist_reduce_blanks
