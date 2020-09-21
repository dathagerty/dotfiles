#!/bin/zsh

# Disable Global RCs
#--------------------
# Prevents zsh from reading config files from /etc, except for /etc/zshenv

unsetopt global_rcs

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
setopt auto_remove_slash # Remove trailing slash if next char is a word delim
setopt hash_list_all # Before completion, make sure entire path is hashed
setopt glob_complete # Expand globs upon completion
setopt complete_in_word # Completions happen at the cursor's location

# Expansion and Globbing
setopt glob # Perform filename generation (i.e. the use of the * operator)
setopt extended_glob # Use additional glob operators
setopt mark_dirs # Directories resulting from globbing have trailing slashes
setopt nomatch # If a glob fails, the command isn't executed

# History
setopt hist_ignore_all_dups # Ignore all duplicates when writing history
setopt hist_ignore_space # Ignore commands that begin with spaces
setopt inc_append_history # Write commands to history file as soon as possible

# Input/Output
setopt correct # Try to correct the spelling of commands
setopt interactive_comments # Allow comments in interactive shells

# Job Control
setopt auto_continue # When suspended jobs are disowned, resume them in the bg
setopt auto_resume # single-word simple commands are candidates for resumption
setopt bg_nice # Run background jobs at lower priority
setopt check_jobs # Warn about background & suspended jobs on exit

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

# Universal environment
#--------------------

DOTFILES=${HOME}/.dotfiles
export DOTFILES

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export GOPATH=$HOME/code/go
export GOROOT=$HOME/.asdf/installs/golang/1.14.4/go
export NODE_PATH=/usr/local/lib/node
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib

# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

# Path
#--------------------
# Sets path in a way similar to path_helper(8) on OS X
# Takes each line of the following files and adds it to the path
#     ${prefix}/paths.d/${HOSTNAME}
#     ${prefix}/paths
#     /etc/paths
# Same goes for manpath (paths to manual pages), fpath (paths to zsh functions),
# and cdpath (paths whose contents can be cd'd to from anywhere)

typeset -U path manpath fpath cdpath

local prefix="${DOTFILES}/zsh/paths"

path=(
	${(ef)"$(cat ${prefix}/paths.d/${HOST} 2> /dev/null)"}
	${(ef)"$(cat ${prefix}/paths           2> /dev/null)"}
	${(ef)"$(cat /etc/paths                2> /dev/null)"}
	${path}
)

manpath=(
	${(ef)"$(cat ${prefix}/manpaths.d/${HOST} 2> /dev/null)"}
	${(ef)"$(cat ${prefix}/manpaths           2> /dev/null)"}
	${(ef)"$(cat /etc/manpaths                2> /dev/null)"}
	${manpath}
)

fpath=(
	${(ef)"$(cat ${prefix}/fpaths.d/${HOST} 2> /dev/null)"}
	${(ef)"$(cat ${prefix}/fpaths           2> /dev/null)"}
	${(ef)"$(cat /etc/fpaths                2> /dev/null)"}
	${fpath}
)

cdpath=(
	${(ef)"$(cat ${prefix}/cdpaths.d/${HOST} 2> /dev/null)"}
	${(ef)"$(cat ${prefix}/cdpaths           2> /dev/null)"}
	${(ef)"$(cat /etc/cdpaths                2> /dev/null)"}
	${cdpath}
)

PATH=".git/safe/../../bin:$PATH"

export path manpath fpath cdpath
