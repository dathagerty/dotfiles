#! /bin/sh

# Install Homebrew
echo "Let's set up your laptop.\nWe will start with git.\n"
echo "Enter your git credentials for this system\n"
echo "Enter your name:"
read NAME
echo "Enter your email: "
read EMAIL

echo "\n ▶️ Setting up XCode CLT\n"
xcode-select --install

echo "\n ▶ Installing Homebrew\n"
if [ brew -v >> /dev/null ]; then
    echo "Homebrew is already installed"
else
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew not installed"
fi

echo "\n ▶️ Cloning dotfiles\n"
if [ ! -e ~/.dotfiles ]; then
    #git clone "https://github.com/dhagerty9009/dotfiles.git" ~/.dotfiles
    echo "Dotfiles are not present on this computer"
else   
    echo "Dotfiles are present"
fi

echo "\n ▶️ Installing brew dependencies\n"
brew bundle --file="$HOME/.dotfiles/Brewfile"

echo "\n ▶️ Setting up local configuration\n"
RCRC="$HOME/.dotfiles/tag-misc/rcrc" rcup -v

echo "\n ▶️ Setting up vim\n"
if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "-- You must run `vim +PluginInstall` once this script has finished running --"
fi

echo "\n ▶️ Installing NVM and Node\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm --version >> /dev/null && nvm install node
npm install -g pure-prompt

echo "\n ▶️ Setting up system git\n"
git config --system user.name $NAME
git config --system user.email $EMAIL
