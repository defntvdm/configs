export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
)

alias copy='xclip -selection c'
export CCPREFIX=arm-linux-gnueabihf-
export CCPREFIX64=aarch64-linux-gnu-
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PIPENV_VENV_IN_PROJECT=true

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

