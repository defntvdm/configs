export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
  poetry
  pyenv
)

# aliases
alias copy='xclip -selection c'
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# zsh extentions
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
