export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
)

# aliases
alias copy='xclip -selection c'
alias vpnon='sudo systemctl start wg-quick@wg0'
alias vpnoff='sudo systemctl stop wg-quick@wg0'
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'

# cross compiling
export CCPREFIX=arm-linux-gnueabihf-
export CCPREFIX64=aarch64-linux-gnu-

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# pipenv
export PIPENV_VENV_IN_PROJECT=true
export PIPENV_SKIP_LOCK=true

# zsh extentions
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

