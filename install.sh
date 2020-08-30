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
fancy_echo "Let's set up your laptop 💻."
fancy_echo "Enter your git credentials for this laptop"
# fancy_echo "Enter your name:"
# read -r NAME
# fancy_echo "Enter your email: "
# read -r EMAIL

# fancy_echo "▶️ Setting up XCode CLT"
# xcode-select --install

fancy_echo "▶ Installing Homebrew"
if which brew > /dev/null ; then
    print_green "Homebrew is already installed")
else
    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    print bold "$(print_red "Homebrew not installed")"
fi

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
