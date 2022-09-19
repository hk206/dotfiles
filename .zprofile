eval "$(/opt/homebrew/bin/brew shellenv)"

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
  /Applications/Visual Studio Code.app/Contents/Resources/app/bin
)
