######################################################################
#                                                                    #
#                                                                    #
#                                                                    #
#                                                                    #
#                The Zsh Configuraton of David Hagerty               #
#                                                                    #
#                      Crafted with Loving Care                      #
#                           Over the Years                           #
#                     For Increased Productivity                     #
#                       And Incredible Utility                       #
#                                                                    #
#                              (c) 2016                              #
#                                                                    #
#                                                                    #
#                                                                    #
######################################################################

export DOTFILES=/Users/david/dotfiles

# Bring all my aliases and functions into .zshrc
source $DOTFILES/zshfunctions

# Start settings for antigen
source $DOTFILES/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle rails
antigen bundle brew
antigen bundle ruby
antigen bundle osx
antigen bundle docker
antigen bundle gitignore
antigen bundle rbenv
antigen bundle bundler
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/rake-completion.zshplugin

antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

antigen apply

BULLETTRAIN_RUBY_BG="red"
BULLETTRAIN_RUBY_FG="black"
BULLETTRAIN_RUBY_PREFIX="♦︎"

export TERM="screen-256color"

export RBENV_VERSION='2.2.3'

export EDITOR="vim"

export CASE_SENSITIVE="false"

autoload -U compinit && compinit

export NODE_PATH=/usr/local/lib/node

export PATH=/usr/local/bin:$PATH

export HAXE_STD_PATH="/usr/local/lib/haxe/std"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

fpath=(/usr/local/share/zsh-completions $fpath)

. `brew --prefix`/etc/profile.d/z.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /Users/david/.secrets

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[ -f /Users/david/.travis/travis.sh ] && source /Users/david/.travis/travis.sh

source /Users/david/.iterm2_shell_integration.zsh
