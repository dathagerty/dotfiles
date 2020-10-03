#! /bin/sh

fancy_echo() {
  fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

print_red() {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

print_green() {
    echo "$(tput setaf 2)$1$(tput sgr0)"
}

print_yellow() {
    echo "$(tput setaf 3)$1$(tput sgr0)"
}

print_blue() {
    echo "$(tput setaf 4)$1$(tput sgr0)"
}

print_magenta() {
    echo "$(tput setaf 5)$1$(tput sgr0)"
}

print_cyan() {
    echo "$(tput setaf 6)$1$(tput sgr0)"
}

print_bold() {
    echo "$(tput bold)$1$(tput sgr0)"
}

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
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fancy_echo "▶️ Cloning dotfiles"
if [ ! -e ~/.dotfiles ]; then
    #git clone "https://github.com/dhagerty9009/dotfiles.git" ~/.dotfiles
    fancy_echo "Dotfiles are not present on this computer"
    # fancy_echo "▶️ Setting up local configuration"
    # RCRC="$HOME/.dotfiles/tag-misc/rcrc" rcup -v
else   
    fancy_echo "Dotfiles are present"
fi

# fancy_echo "▶️ Installing brew dependencies"
# brew bundle --file="$HOME/.dotfiles/Brewfile"

# fancy_echo "▶️ Setting up vim"
# if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
#     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#     fancy_echo "-- You must run 'vim +PluginInstall' once this script has finished running --"
# fi

# fancy_echo "▶️ Installing NVM and Node"
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# nvm --version >> /dev/null && nvm install node
# npm install -g pure-prompt

# fancy_echo "▶️ Setting up system git"
# git config --system user.name "$NAME"
# git config --system user.email "$EMAIL"
fancy_echo "If you are planning on using signed commits, you will need to set up GPG"
