#######
# ZSH #
#######
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  docker
  docker-compose
  git
  rust
  vscode
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

###########
# aliases #
###########
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'
alias n='neovide'

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
export PYENV_ROOT="$(pyenv root)"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

################
# ssh add keys #
################
if [[ -v SSH_AUTH_SOCK ]]; then
    ssh-add ~/.ssh/id_rsa 2>/dev/null
fi;

