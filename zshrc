#######
# ZSH #
#######
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"
CASE_SENSITIVE="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

###########
# aliases #
###########
alias copy='xclip -selection c'
alias http='http -v -s monokai'
alias tmux='tmux a || tmux'

##########
# golang #
##########
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#########
# pyenv #
#########
export PATH=$PATH:$HOME/.local/bin
export PYENV_ROOT="$(pyenv root)"

if [ ! -f $PYENV_ROOT/completions/pyenv.zsh ];
then
  mkdir -p $PYENV_ROOT/completions/
  cp /usr/share/zsh/site-functions/_pyenv $PYENV_ROOT/completions/pyenv.zsh
fi

eval "$(pyenv init -)" > /dev/null
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


############
# Just env #
############
export VISUAL="nvim"
