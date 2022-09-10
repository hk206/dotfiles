THIS_DIR=$(cd $(dirname $0); pwd)

for dotfile in .zshrc .zprofile .alias.zsh .gitconfig .gitignore; do
	ln -snfv "${THIS_DIR}/$dotfile" "$HOME/$dotfile"
done

# Homebrew
cd $THIS_DIR/homebrew
./setup.sh
cd $THIS_DIR

# n
ln -snfv "$(pwd)/.node-version" "$HOME/.node-version"
sudo mkdir -p /usr/local/n
sudo chown -R "$(whoami)" "/usr/local/n"
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
sudo chown -R "$(whoami)" "/usr/local/bin" "/usr/local/lib" "/usr/local/include" "/usr/local/share"
n auto

# VSCode
./vscode/setup.sh

# Mac Setup
./mac/setup.sh
