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
alias copy='xclip -selection c'
PS1='\[\033[1;34m\]\h \[\033[1;32m\]\W\[\033[0m\] \$ '

export PIPENV_VENV_IN_PROJECT=1
export CCPREFIX=arm-linux-gnueabihf-
export CCPREFIX64=aarch64-linux-gnu-
export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin:/opt/cr055_c0mp1l3/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin

