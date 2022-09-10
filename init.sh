THIS_DIR=$(cd $(dirname $0); pwd)

for dotfile in .zshrc .zprofile .alias.zsh .gitconfig .gitignore; do
	ln -snfv "${THIS_DIR}/$dotfile" "$HOME/$dotfile"
done

# Homebrew
cd $THIS_DIR/homebrew
./setup.sh
cd $THIS_DIR

# asdf
ln -snfv "$(pwd)/.node-versions" "$HOME/.node-versions"
sudo mkdir -p "/usr/local/n"
sudo chown -R "$HOME/usr/local/n"
n install

# VSCode
./vscode/setup.sh

# Mac Setup
./mac/setup.sh