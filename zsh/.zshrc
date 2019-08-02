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


# Shell Options
#--------------------
# zshoptions(1)  /  http://zsh.sourceforge.net/Doc/Release/Options.html

# Changing Directories
setopt auto_cd # If command is a directory path, cd to it
setopt auto_pushd # cd is really pushd
setopt chase_dots # Resolve `..` directories to their true location
setopt chase_links # Resolve links to their true location
setopt pushd_ignore_dups # Don't put duplicates on the directory stack
setopt pushd_minus # Make `cd -1` go to the previous directory, etc
setopt pushd_to_home # pushd with no arguments goes home, like cd

# Completion
# setopt auto_name_dirs # Parameters set to a path can be used as ~param
setopt auto_remove_slash # Remove trailing slash if next char is a word delim
setopt hash_list_all # Before completion, make sure entire path is hashed
setopt glob_complete # Expand globs upon completion
setopt complete_in_word # Completions happen at the cursor's location

# Expansion and Globbing
setopt glob # Perform filename generation (i.e. the use of the * operator)
setopt extended_glob # Use additional glob operators
# setopt glob_dots # Glob dotfiles
setopt mark_dirs # Directories resulting from globbing have trailing slashes
setopt nomatch # If a glob fails, the command isn't executed

# History
setopt hist_ignore_all_dups # Ignore all duplicates when writing history
setopt hist_ignore_space # Ignore commands that begin with spaces
setopt inc_append_history # Write commands to history file as soon as possible

# Input/Output
# setopt noclobber # Prevents `>` from clobbering files. Use `>|` to clobber.
setopt correct # Try to correct the spelling of commands
setopt interactive_comments # Allow comments in interactive shells

# Job Control
setopt auto_continue # When suspended jobs are disowned, resume them in the bg
setopt auto_resume # single-word simple commands are candidates for resumption
setopt bg_nice # Run background jobs at lower priority
setopt check_jobs # Warn about background & suspended jobs on exit
setopt monitor # Enable job control. This is default.

# Prompting
setopt prompt_cr # Print a \r before the prompt
setopt prompt_sp # Preserve lines that would be covered by the \r
setopt prompt_subst # Substitute in parameter/command/arithmetic expansions

# ZLE
# setopt no_beep # The shell shouldn't beep on ZLE errors (most beeps)
setopt zle # Use ZLE. This is default, but I like to be explicit
# Enable Vim-style editing of ZLE
bindkey -v


# Aliases
#--------------------

alias sed="sed -r"
alias ls="ls -a -l --human-readable --classify --group-directories-first --color=auto"
alias mkdir="mkdir -p"
alias grep="grep --extended-regexp --no-messages --binary-files=without-match --line-number --color"
alias cat=bat

## Homebrew Aliases

alias b=brew
alias bup="brew upgrade && brew cleanup"
alias cask="brew cask"

## Git Aliases

alias g="git"
alias git=hub
alias glog="git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | vim -R -c 'set filetype=git nowrap' -"

## Docker Aliases

alias doco="docker-compose"
alias doma="docker-machine"
alias dcr="docker-compose run"
alias lzd=lazydocker
alias k=kubectl

## Rails Aliases

alias be="bundle exec"
alias r="bin/rails"
alias routes="bin/rails routes"
alias rc="bin/rails console"
alias rs="bin/rails server"

## Navigation Aliases

function mcd { mkdir $1; cd $1; }
function cdl { cd $1; ls -a; }
function mct { mkdir $1; cd $1; touch $2; }

## Editing Aliases

alias v=nvim

# Environment
#--------------------
export NODE_PATH=/usr/local/lib/node

. `brew --prefix`/etc/profile.d/z.sh
. $(brew --prefix asdf)/asdf.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/.iterm2_shell_integration.zsh
source /usr/local/Cellar/kube-ps1/0.7.0/share/kube-ps1.sh
source ${HOME}/.zsh/zsh-plugins.sh

# Core tools
LESS="-RSMsi"
EDITOR="nvim"
VISUAL="nvim"
PAGER="less"
export LESS EDITOR VISUAL PAGER

# History
#--------------------

HISTSIZE=2000
HISTFILE=${HOME}/.zshhistory
SAVEHIST=$HISTSIZE
export HISTSIZE HISTFILE SAVEHIST

# Prompt
#--------------------

autoload -Uz promptinit; promptinit
# prompt pure
# export PROMPT='$(kube_ps1)'$PROMPT


# Completion
#--------------------

autoload -Uz compinit && compinit -u

zstyle ':completion:*' use-cache true # Cache completion to `${ZDOTDIR}/.zcompcache`
zstyle ':completion:*' squeeze-slashes true # Strip slashes from directories
zstyle ':completion:*' menu select # Make the menu interactive with arrow keys

bindkey '^I' menu-expand-or-complete
bindkey '^[[Z' reverse-menu-complete


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
# Use the `l` command to print both the directory listing and git status
# Use `ll` to include dotfiles

function l {
	git -C $PWD/$1:h/$1:t status -sb $PWD/$1 2>/dev/null
	ls $@ --format=long
}

function ll {
	git -C $PWD/$1:h/$1:t status -sb $PWD/$1 2>/dev/null
	ls $@ --format=long --almost-all
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

# Startup
#--------------------

print "\r${USER} @ ${HOST}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ -f ~/.dotfiles/zsh/.p10k.zsh ]] && source ~/.dotfiles/zsh/.p10k.zsh
