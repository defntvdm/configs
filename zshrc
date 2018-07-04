export ZSH="/home/defntvdm/.oh-my-zsh"

ZSH_THEME="fishy"
CASE_SENSITIVE="true"

plugins=(
  git
)

alias copy='xclip -selection c'
export CCPREFIX=arm-linux-gnueabihf-
export CCPREFIX64=aarch64-linux-gnu-
export GOPATH=$HOME/projects/go
export PATH=$PATH:$GOPATH/bin:/opt/cr055_c0mp1l3/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

