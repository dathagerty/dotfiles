#! /bin/zsh

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
#                              (c) 2019                              #
#                                                                    #
#                                                                    #
#                                                                    #
######################################################################


# Aliases
#--------------------

## fasd aliases

alias fv='f -e nvim'

## Conveniences for common commands

alias sed="sed -r"
alias ls="exa -laF --git --group-directories-first"
alias mkdir="mkdir -p"
alias grep="grep --extended-regexp --no-messages --binary-files=without-match --line-number --color"
alias cat='bat --theme="Nord"'
alias dots="cd $DOTFILES"

## Homebrew Aliases

alias b=brew
alias bup="brew upgrade && brew cleanup"
alias cask="brew cask"

## Git Aliases

alias g="git"
alias git=hub
alias rl="g reflog"
alias glog="g log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | vim -R -c 'set filetype=git nowrap' -"

## Docker Aliases

alias doco="docker-compose"
alias doma="docker-machine"
alias dcr="docker-compose run"
alias lzd=lazydocker
alias k=kubectl
alias kgp="k get pods"
alias kdp="k delete pod"
alias kctx=kubectx
alias kns=kubens
alias ka="k apply -f"

## Rails Aliases

alias be="bundle exec"
alias r="bin/rails"
alias routes="bin/rails routes"
alias rc="bin/rails console"
alias rs="bin/rails server"

## Editing Aliases

alias v=nvim

## Work Aliases/Functions

alias login-riotp="aws-login -a cfaiotprod -n devops && kctx riot-prod"
alias login-riotnp="aws-login -a cfaiotdev -n Admin && kctx riot-dev"
alias login-csnp="aws-login -a cfacoreservicesnp -n devops"
alias login-csp="aws-login -a cfacoreserviceprod -n devops"


# zmv - Batch Rename
#--------------------

autoload -Uz zmv
alias mv="noglob zmv"

# EX: Rename all .cpp files to .cc
#     zmv '(*).cpp' '$1.cc'
# Arguments are quoted to escape the globbing system
# Use `-n` for a dry-run


# Quick Status
#--------------------

function l {
	git -C $PWD/$1:h/$1:t status -sb $PWD/$1 2>/dev/null
	ls $@ --format=long
}


# Rationalize Dots
#--------------------

function rationalize-dot {
	if [[ $LBUFFER = *... ]]; then
		LBUFFER=$LBUFFER[1,-2]
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}
zle -N rationalize-dot
bindkey . rationalize-dot


# Completion
#--------------------

autoload -Uz compinit && compinit -u

zstyle ':completion:*' use-cache true # Cache completion to `${ZDOTDIR}/.zcompcache`
zstyle ':completion:*' squeeze-slashes true # Strip slashes from directories
zstyle ':completion:*' menu select # Make the menu interactive with arrow keys

bindkey '^I' menu-expand-or-complete
bindkey '^[[Z' reverse-menu-complete


# Startup
#--------------------

eval "$(fasd --init auto)"
. $(brew --prefix asdf)/asdf.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.iterm2_shell_integration.zsh
source ${HOME}/.zsh/zsh-plugins.sh

iterm2_print_user_vars() {
	iterm2_set_user_var goVersion $(asdf current golang)
	iterm2_set_user_var rubyVersion $(asdf current ruby)
	iterm2_set_user_var pythonVersion $(asdf current python)
	iterm2_set_user_var nodeVersion $(asdf current nodejs)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

print "\rReady for input"