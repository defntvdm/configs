#######
# ZSH #
#######
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
  vscode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

###########
# aliases #
###########
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'

##########
# golang #
##########
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

############
# Just env #
############
export VISUAL="nvim"

#########
# pyenv #
#########
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
