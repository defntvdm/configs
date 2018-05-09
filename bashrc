#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls'
alias la='ls -lA'
alias ll='ls -lah'
alias grep='grep --color=auto'
GOPATH=~/projects/go
PS1=' \[\033[1;32m\]\W\[\033[0m\] \$ '
